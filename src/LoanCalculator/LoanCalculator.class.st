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
	
]

{ #category : 'accessing' }
LoanCalculator class >> initialize [ 
	<pharoJsSkip>
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
