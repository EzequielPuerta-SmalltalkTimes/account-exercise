Class {
	#name : #CheckingAccountTest,
	#superclass : #AccountTest,
	#category : #'Exercise-Account-Tests'
}

{ #category : #tests }
CheckingAccountTest >> testCreation [

	| account |
	
	account := 
		CheckingAccount
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
CheckingAccountTest >> testInvalidCreationWithInvalidIdentifier [

	self 
		should: [ 
			CheckingAccount
				identifiedAs: -123
				belongingTo: self customer
				forTradesIssuedOn: self peso
				openedSince: self today ]
		raise: InstanceCreationFailed
		withMessageText: 'El identificador de cuenta debe ser un entero positivo.'
]

{ #category : #tests }
CheckingAccountTest >> testNegativeBalance [

	| account |
	
	account := 
		CheckingAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.

	self assert: account balance equals: (self peso with: 0).
	account transact: (self peso with: 50).
	self assert: account balance equals: (self peso with: 50).
	account transact: (self peso with: -60).
	self assert: account balance equals: (self peso with: -10)
]

{ #category : #tests }
CheckingAccountTest >> testPrintOn [

	| account |
	
	account := 
		CheckingAccount
			identifiedAs: 123
			belongingTo: self customer
			forTradesIssuedOn: self peso
			openedSince: self today.
			
	self
		assert: account printString
		equals: ('Cuenta corriente <1s> en <2s> a nombre de <3s>.'
				expandMacrosWith: 123 printString
				with: self peso printString
				with: self customer printString)
]

{ #category : #tests }
CheckingAccountTest >> testTransact [

	| account |
	
	account := 
		CheckingAccount
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
