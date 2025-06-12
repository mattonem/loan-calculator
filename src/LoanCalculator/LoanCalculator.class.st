Class {
	#name : 'LoanCalculator',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#classInstVars : [
		'staticComponents'],
	#category : 'LoanCalculator-Core',
	#package : 'LoanCalculator',
	#tag : 'Core'
}

{ #category : 'accessing' }
LoanCalculator class >> appClasses [
	^ super appClasses 
]

{ #category : 'accessing' }
LoanCalculator class >> bridgeClass [
	<pharoJsSkip>
	^ PjBridge
]

{ #category : 'accessing' }
LoanCalculator class >> bridgeClientClass [
	<pharoJsSkip>
	
	^ PjZnHostedBrowserBridgeClient
]


{ #category : 'accessing' }
LoanCalculator class >> exporterClass [

	<pharoJsSkip>
	^ PjFileExporterWithIndexHtml
]

{ #category : 'accessing' }
LoanCalculator class >> generateHtmlUsing: html [

	<pharoJsSkip>

	html div class: 'container mt-5'; with: [
		html div class: 'row justify-content-center'; with: [
			html div class: 'col-md-6'; with: [
				html div class: 'card'; with: [
					html div class: 'card-header'; with: [ html text: 'Loan Calculator' ].
					html div class: 'card-body'; with: [
						html form with: [
							html div class: 'mb-3'; with: [
								html label class: 'form-label'; for: 'loanAmount'; with: [ html text: 'Loan amount' ].
								html numberInput class: 'form-control'; id: 'loanAmount'; placeholder: 'Enter loan amount'; value: 10000.
							].
							html div class: 'mb-3'; with: [
								html label class: 'form-label'; for: 'loanTerm'; with: [ html text: 'Loan term (years)' ].
								html numberInput class: 'form-control'; id: 'loanTerm'; placeholder: 'Enter loan term'; value: 10.
							].
							html div class: 'mb-3'; with: [
								html label class: 'form-label'; for: 'interestRate'; with: [ html text: 'Interest rate (%)' ].
								html numberInput class: 'form-control'; id: 'interestRate'; placeholder: 'Enter interest rate'; step: '0.01'; value: 5.
							].
							html submitButton class: 'btn btn-primary'.
						].
					].
				].

				html div class: 'card'; with: [
					
					html div class: 'card-body'; id: 'result'.
				].
			].
		].
	].
]

{ #category : 'accessing' }
LoanCalculator class >> initialize [ 
	<pharoJsSkip>
	super initialize.
]

{ #category : 'accessing' }
LoanCalculator class >> staticComponentsSerialized [

	<jsLiteralGenerator>
	^ self _staticComponents asPhxJsonString
]

{ #category : 'accessing' }
LoanCalculator class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css'.
		
]


{ #category : 'initialize-release' }
LoanCalculator >> start [
	
	super start.

	(document querySelector: 'form') addEventListener: 'submit' do: [ :event |
		| frag |
		event preventDefault.
		console log: 'amortizationTableFor: interestRate: term:'.
		frag := document createElement: 'template'.
		frag innerHTML: (WCHtmlCanvas builder
			fullDocument: false;
			render: [ :html | self 
				amortizationTableHtmlFor: (document getElementById: 'loanAmount') value asNumber 
				interest: (document getElementById: 'interestRate') value asNumber  
				term: (document getElementById: 'loanTerm') value asNumber 
				html: html ]).
		(document getElementById:'result') appendChild: frag content.
	].
	
]

{ #category : 'calculation' }
LoanCalculator >> amortizationTableFor: loanAmount interest: interestRate term: loanTerm [
	| principal interest monthlyRate n schedule remaining principalPayment interestPayment payment |
	"Calculate monthly payment and build amortization schedule as a table."
	monthlyRate := (interestRate / 100) / 12.
	n := loanTerm * 12.
	payment := (loanAmount * (monthlyRate * ((1 + monthlyRate) raisedTo: n))) / (((1 + monthlyRate) raisedTo: n) - 1).
	console log: 'Monthly payment: ', payment asString.
	schedule := OrderedCollection new.
	remaining := loanAmount.
	1 to: n do: [:month |
		interestPayment := remaining * monthlyRate.
		principalPayment := payment - interestPayment.
		remaining := remaining - principalPayment.
		schedule add: { month. principalPayment. interestPayment. remaining max: 0 }.
	].
	^ schedule
]

LoanCalculator >> amortizationTableHtmlFor: loanAmount interest: interestRate term: loanTerm html: html [
	| schedule |
	schedule := self amortizationTableFor: loanAmount interest: interestRate term: loanTerm.

	html table class: 'table table-striped'; with: [
		html tableHead with: [
			html tableRow with: [
				html tableHeading with: [ html text: 'Month' ].
				html tableHeading with: [ html text: 'Principal' ].
				html tableHeading with: [ html text: 'Interest' ].
				html tableHeading with: [ html text: 'Balance' ].
			].
		].
		html tableBody with: [
			schedule do: [:row |
				html tableRow with: [
					html tableColumn with: [ html text: row first asString ].
					html tableColumn with: [ html text: (self decimalRounded: (row second asFloat) decimal: 2 )].
					html tableColumn with: [ html text: (self decimalRounded: (row third asFloat) decimal: 2 )].
					html tableColumn with: [ html text: (self decimalRounded: (row fourth asFloat) decimal: 2 )].
				].
			].
		].
	].
]

LoanCalculator >> decimalRounded: value decimal: decimal [
	| factor |
	factor := 10 raisedTo: decimal.
	^ (value * factor) rounded / factor
]