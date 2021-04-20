Class {
	#name : #SavingsAccountTest,
	#superclass : #AccountTest,
	#category : #'Exercise-Account-Tests'
}

{ #category : #tests }
SavingsAccountTest >> testCreation [

	| account |
	
	account := 
		SavingsAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.
			
	self
		assert: account identifier equals: 123;
		assert: account customer equals: self customer;
		assert: account currency equals: self peso;
		assert: account registrationDate equals: self today;
		assert: account balance equals: (self peso with: 0)
]

{ #category : #tests }
SavingsAccountTest >> testInvalidCreationWithInvalidIdentifier [

	self 
		should: [ 
			SavingsAccount
				identifiedAs: -123
				belongingTo: self customer
				forTradesIssuedOn: self peso
				openedSince: self today ]
		raise: InstanceCreationFailed
		withMessageText: 'El identificador de cuenta debe ser un entero positivo.'
]

{ #category : #tests }
SavingsAccountTest >> testNegativeBalance [

	| account |
	
	account := 
		SavingsAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.

	self assert: account balance equals: (self peso with: 0).
	account transact: (self peso with: 50).
	self assert: account balance equals: (self peso with: 50).

	self
		should: [ account transact: (self peso with: -60) ]
		raise: AssertionFailed 
		withMessageText: 'La caja de ahorro no puede tener saldo descubierto.'
]

{ #category : #tests }
SavingsAccountTest >> testPrintOn [

	| account |
	
	account := 
		SavingsAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.
			
	self
		assert: account printString 
		equals: ('Caja de ahorros <1s> en <2s> a nombre de <3s>.'
				expandMacrosWith: 123 printString
				with: self peso printString
				with: self customer printString)
]

{ #category : #tests }
SavingsAccountTest >> testTransact [

	| account |
	
	account := 
		SavingsAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.

	self assert: account balance equals: (self peso with: 0).
	account transact: (self peso with: 100).
	self assert: account balance equals: (self peso with: 100).
	account transact: (self peso with: -60).
	self assert: account balance equals: (self peso with: 40)
]
