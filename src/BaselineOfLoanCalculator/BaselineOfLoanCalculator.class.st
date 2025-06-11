Class {
	#name : 'BaselineOfLoanCalculator',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLoanCalculator',
	#package : 'BaselineOfLoanCalculator'
}

{ #category : 'baselines' }
BaselineOfLoanCalculator >> baseline: spec [

	<baseline>
	spec for: #common do: [

		spec
			baseline: 'Camping'
			with: [ spec repository: 'github://mattonem/WildCamping' ].

		spec package: #LoanCalculator with: [ spec requires: #( Camping ) ] ]
]
