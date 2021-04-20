Class {
	#name : #AccountApplication,
	#superclass : #WillowApplication,
	#category : #'Exercise-Account-Application'
}

{ #category : #accessing }
AccountApplication class >> applicationTitle [

	^ 'Sistema de Cuentas'
]

{ #category : #accessing }
AccountApplication class >> handlerName [

	^ 'account-system'
]

{ #category : #accessing }
AccountApplication class >> sessionClass [

	^ AccountApplicationSession
]

{ #category : #accessing }
AccountApplication >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier
		withBootstrapLibrary: 
			(self deploymentMode libraryFor: Bootstrap3MetadataLibrary) withoutOptionalTheme
		selectLibrary: 
			((self deploymentMode libraryFor: BootstrapSelectLibrary) using: self language)
		datepickerLibrary: 
			((self deploymentMode libraryFor: BootstrapDatepickerLibrary) using: self language)
		typeaheadLibrary: 
			(self deploymentMode libraryFor: BootstrapTypeaheadLibrary) new
]

{ #category : #accessing }
AccountApplication >> contentView [

	^ [ :canvas | 
		canvas heading level1; with: 'Sistema de cuentas'.

		canvas render: AccountDashboardWebView new]
]

{ #category : #accessing }
AccountApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default  
]
