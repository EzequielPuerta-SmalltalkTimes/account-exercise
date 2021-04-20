Class {
	#name : #CustomerTest,
	#superclass : #TestCase,
	#category : #'Exercise-Account-Tests'
}

{ #category : #tests }
CustomerTest >> testCreation [
	
	self assert: (Customer named: 'Ezequiel Puerta') name equals: 'Ezequiel Puerta'
]

{ #category : #tests }
CustomerTest >> testInvalidCreation [

	self 
		should: [ 
			Customer named: '' ]
		raise: InstanceCreationFailed
		withMessageText: 'El nombre de cliente no puede ser vacio.'
]

{ #category : #tests }
CustomerTest >> testPrintOn [
	
	| customer |
	
	customer := Customer named: 'Ezequiel Puerta'.
	self assert: customer printString equals: 'Ezequiel Puerta'
]
