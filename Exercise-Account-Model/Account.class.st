Class {
	#name : #Account,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'customer',
		'currency',
		'registrationDate',
		'balance'
	],
	#category : #'Exercise-Account-Model'
}

{ #category : #validations }
Account class >> assertIsValidCustomer: aCustomer [

	AssertionChecker 
		enforce: [ aCustomer name isNotEmpty ]
		because: 'El nombre de cliente no puede ser vacio.'
		raising: InstanceCreationFailed
]

{ #category : #validations }
Account class >> assertIsValidIdentifier: anIdentifier [

	AssertionChecker 
		enforce: [ anIdentifier positive ]
		because: 'El identificador de cuenta debe ser un entero positivo.'
		raising: InstanceCreationFailed
]

{ #category : #'instance creation' }
Account class >> identifiedAs: anIdentifier 
	belongingTo: aCustomer 
	forTradesIssuedOn: aCurrency 
	openedSince: aDate [ 
	
	self 
		assertIsValidIdentifier: anIdentifier;
		assertIsValidCustomer: aCustomer.
	
	^ self new
		initializeIdentifiedAs: anIdentifier
		belongingTo: aCustomer
		forTradesIssuedOn: aCurrency
		openedSince: aDate
]

{ #category : #validations }
Account class >> typeDescription [

	self subclassResponsibility 
]

{ #category : #accessing }
Account >> balance [

	^ balance
]

{ #category : #accessing }
Account >> currency [

	^ currency
]

{ #category : #accessing }
Account >> customer [

	^ customer
]

{ #category : #accessing }
Account >> identifier [

	^ identifier
]

{ #category : #initialization }
Account >> initializeIdentifiedAs: anIdentifier 
	belongingTo: aCustomer 
	forTradesIssuedOn: aCurrency 
	openedSince: aDate [
	
	balance := aCurrency with: 0.
	identifier := anIdentifier.
	customer := aCustomer.
	currency := aCurrency.
	registrationDate := aDate
]

{ #category : #accessing }
Account >> printOn: aStream [

	self subclassResponsibility 
]

{ #category : #accessing }
Account >> registrationDate [

	^ registrationDate
]

{ #category : #accessing }
Account >> transact: anAmount [
		
	self subclassResponsibility 
]
