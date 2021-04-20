Class {
	#name : #AccountApplicationSession,
	#superclass : #WillowSession,
	#instVars : [
		'applicationContext'
	],
	#category : #'Exercise-Account-Application'
}

{ #category : #accessing }
AccountApplicationSession >> applicationContext [

	^ applicationContext
]

{ #category : #accessing }
AccountApplicationSession >> startUpApplicationContextFor: aWillowApplication [

	super startUpApplicationContextFor: aWillowApplication.
	applicationContext := AccountApplicationContext new
]
