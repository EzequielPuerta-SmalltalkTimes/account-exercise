Class {
	#name : #AccountTest,
	#superclass : #TestCase,
	#instVars : [
		'customer',
		'today',
		'peso'
	],
	#category : #'Exercise-Account-Tests'
}

{ #category : #accessing }
AccountTest >> customer [ 

	^ customer
]

{ #category : #accessing }
AccountTest >> peso [

	^ peso
]

{ #category : #tests }
AccountTest >> setUp [ 

	customer := Customer named: 'Ezequiel Puerta'.
	today := April twentieth, 2021.
	peso := 
		BaseUnit 
			nameForOne: 'Peso' 
			nameForMany: 'Pesos' 
			sign: '$'.
]

{ #category : #accessing }
AccountTest >> today [ 

	^ today
]
