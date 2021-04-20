Class {
	#name : #AccountApplicationRunner,
	#superclass : #Object,
	#category : #'Exercise-Account-Application'
}

{ #category : #accessing }
AccountApplicationRunner class >> run [

	^ self runOn: 8080
]

{ #category : #accessing }
AccountApplicationRunner class >> runOn: aPortNumber [

	(ZnZincServerAdaptor port: aPortNumber) start.
	AccountApplication registerAsDevelopmentApplication.
	
	('localhost:<1s>/<2s>' 
		expandMacrosWith: aPortNumber printString 
		with: AccountApplication handlerName) 
			inspect
]
