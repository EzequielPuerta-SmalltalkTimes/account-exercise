Class {
	#name : #Customer,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Exercise-Account-Model'
}

{ #category : #'instance creation' }
Customer class >> assertIsValidName: aName [

	AssertionChecker 
		enforce: [ aName isNotEmpty ]
		because: 'El nombre de cliente no puede ser vacio.'
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
Customer class >> named: aName [

	self assertIsValidName: aName.
	^ self new initializeNamed: aName
]

{ #category : #initialization }
Customer >> initializeNamed: aName [

	name := aName
]

{ #category : #accessing }
Customer >> name [

	^ name
]

{ #category : #accessing }
Customer >> printOn: aStream [

	aStream nextPutAll: self name 
]
