Class {
	#name : #AccountApplicationContext,
	#superclass : #GRObject,
	#instVars : [
		'selectedAccountTypeOptional',
		'allAccounts'
	],
	#category : #'Exercise-Account-Application'
}

{ #category : #initialization }
AccountApplicationContext >> availableAccountTypes [

	^ OrderedCollection with: CheckingAccount with: SavingsAccount
]

{ #category : #initialization }
AccountApplicationContext >> availableAccounts [

	^ selectedAccountTypeOptional
		withContentDo: [ :accountType | allAccounts select: [ :account | account isA: accountType ] ]
		ifUnused: [ OrderedCollection new ]
]

{ #category : #initialization }
AccountApplicationContext >> dollar [

	^ BaseUnit 
		nameForOne: 'Dolar' 
		nameForMany: 'Dolares' 
		sign: 'U$D'
]

{ #category : #initialization }
AccountApplicationContext >> initialize [

	super initialize.
	self initializeAllAccounts.
	selectedAccountTypeOptional := Optional unused
]

{ #category : #initialization }
AccountApplicationContext >> initializeAllAccounts [

	allAccounts := 
		OrderedCollection
			with: (
				SavingsAccount
					identifiedAs: 1
					belongingTo: (Customer named: 'Ezequiel Puerta')
					forTradesIssuedOn: self peso
					openedSince: self today)
			with: (
				SavingsAccount
					identifiedAs: 2
					belongingTo: (Customer named: 'Ezequiel Puerta')
					forTradesIssuedOn: self dollar
					openedSince: self today)
			with: (
				CheckingAccount
					identifiedAs: 3
					belongingTo: (Customer named: 'Ezequiel Puerta')
					forTradesIssuedOn: self peso
					openedSince: self today)
]

{ #category : #initialization }
AccountApplicationContext >> peso [

	^ BaseUnit 
		nameForOne: 'Peso' 
		nameForMany: 'Pesos' 
		sign: '$'
]

{ #category : #initialization }
AccountApplicationContext >> setSelectedAccountTypeTo: anAccountClass [

	selectedAccountTypeOptional := Optional containing: anAccountClass
]

{ #category : #initialization }
AccountApplicationContext >> today [

	^ April twentieth, 2021
]
