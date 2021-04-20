Class {
	#name : #CheckingAccount,
	#superclass : #Account,
	#category : #'Exercise-Account-Model'
}

{ #category : #validations }
CheckingAccount class >> typeDescription [

	^ 'Cuenta corriente'
]

{ #category : #printing }
CheckingAccount >> printOn: aStream [

	aStream 
		nextPutAll: 'Cuenta corriente ';
		print: identifier;
		nextPutAll: ' en ';
		print: currency;
		nextPutAll: ' a nombre de ';
		print: customer;
		nextPut: $.
]

{ #category : #accessing }
CheckingAccount >> transact: anAmount [
		
	balance := balance + anAmount
]
