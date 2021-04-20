Class {
	#name : #SavingsAccount,
	#superclass : #Account,
	#category : #'Exercise-Account-Model'
}

{ #category : #validations }
SavingsAccount class >> typeDescription [

	^ 'Caja de ahorro'
]

{ #category : #accessing }
SavingsAccount >> printOn: aStream [

	aStream 
		nextPutAll: 'Caja de ahorros ';
		print: identifier;
		nextPutAll: ' en ';
		print: currency;
		nextPutAll: ' a nombre de ';
		print: customer;
		nextPut: $.
]

{ #category : #accessing }
SavingsAccount >> transact: anAmount [

	AssertionChecker 
		enforce: [ (balance + anAmount) positive ]
		because: 'La caja de ahorro no puede tener saldo descubierto.'.
		
	balance := balance + anAmount
]
