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
								html numberInput class: 'form-control'; id: 'loanAmount'; placeholder: 'Enter loan amount'.
							].
							html div class: 'mb-3'; with: [
								html label class: 'form-label'; for: 'loanTerm'; with: [ html text: 'Loan term (years)' ].
								html numberInput class: 'form-control'; id: 'loanTerm'; placeholder: 'Enter loan term'.
							].
							html div class: 'mb-3'; with: [
								html label class: 'form-label'; for: 'interestRate'; with: [ html text: 'Interest rate (%)' ].
								html numberInput class: 'form-control'; id: 'interestRate'; placeholder: 'Enter interest rate'.
							].
							html submitButton class: 'btn btn-primary'.
						].
					].
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

]
