Class {
	#name : #BaselineOfExerciseAccount,
	#superclass : #BaselineOf,
	#category : #BaselineOfExerciseAccount
}

{ #category : #accessing }
BaselineOfExerciseAccount >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ 
			self setUpDependencies: spec.

			spec
				package: 'Exercise-Account-Model' with: [ spec requires: #('Aconcagua' 'Chalten') ];
				package: 'Exercise-Account-Tests' with: [ spec requires: 'Exercise-Account-Model' ];
				package: 'Exercise-Account-Views' with: [ spec requires: #('Exercise-Account-Model' 'Willow' 'WillowBootstrap' 'WillowSpinKit') ];
				package: 'Exercise-Account-Application' with: [ spec requires: 'Exercise-Account-Views' ]
			]
]

{ #category : #accessing }
BaselineOfExerciseAccount >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfExerciseAccount >> setUpDependencies: spec [

	spec
		baseline: 'Aconcagua' 
			with: [ spec
				repository: 'github://ba-st/Aconcagua:v{XX}/source';
				loads: #('Deployment') ];
		import: 'Aconcagua'.

	spec
		baseline: 'Chalten' 
			with: [ spec 
				repository: 'github://ba-st/Chalten:v8/source';
				loads: #('{Chalten-Gregorian-Calendar}') ];
		import: 'Chalten'.
		
	spec
		baseline: 'Willow' with: [ spec repository: 'github://ba-st/Willow:v14/source' ];
		project: 'Willow-Deployment' copyFrom: 'Willow' with: [ spec loads: 'Deployment' ];
		project: 'Willow-SUnit' copyFrom: 'Willow' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Willow-Core-Tests' copyFrom: 'Willow' with: [ spec loads: 'Tests' ];
		project: 'Willow-Tools' copyFrom: 'Willow' with: [ spec loads: 'Tools' ].
		
	spec
		baseline: 'WillowBootstrap'
			with: [ spec
				repository: 'github://ba-st/Willow-Bootstrap:v13/source';
				loads: #('Deployment') ];
		import: 'WillowBootstrap'.

	spec
		baseline: 'WillowSpinKit'
			with: [ spec
				repository: 'github://ba-st/Willow-SpinKit:v9/source';
				loads: #('Deployment') ];
		import: 'WillowSpinKit'.
]
