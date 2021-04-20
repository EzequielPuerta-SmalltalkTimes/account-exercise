Class {
	#name : #AccountDashboardWebView,
	#superclass : #WAPainter,
	#instVars : [
		'accountTypeDropdownList',
		'identifiedSelection',
		'filteredAccountsListBox'
	],
	#category : #'Exercise-Account-Views'
}

{ #category : #rendering }
AccountDashboardWebView >> initialize [

	super initialize.
	self
		initializeFilteredAccounts;
		initializeIdentifiedSelection;
		initializeAccountTypeDropdownList
]

{ #category : #rendering }
AccountDashboardWebView >> initializeAccountTypeDropdownList [
	
	accountTypeDropdownList := self componentSupplier 
		dropdownListApplying: [ :dropdown | 
			( ListLabelingCommand with: [ :accountType | accountType typeDescription] ) +
				BootstrapSelectLiveSearchCommand default].
		
	accountTypeDropdownList on trigger
		serverDo: [ 
			accountTypeDropdownList
				withCurrentSelectionDo: [ :selectedAccountType | self session applicationContext setSelectedAccountTypeTo: selectedAccountType ] ];
			render: identifiedSelection
]

{ #category : #rendering }
AccountDashboardWebView >> initializeFilteredAccounts [

	filteredAccountsListBox := 
		self componentSupplier
			multipleSelectionListBoxDisplayingAtOnce: 25
			applying: [  ]
]

{ #category : #rendering }
AccountDashboardWebView >> initializeIdentifiedSelection [

	identifiedSelection := self componentSupplier
		divisionContainerWrapping: [ :canvas |
			canvas
				render:
					( self componentSupplier
						delayedViewShowing: SpinKitCircle new
						whileEvaluating: [ filteredAccountsListBox allowAnyOf: self session applicationContext availableAccounts ]
						thenRendering: (
							 self componentSupplier
								labeledFieldApplying: [  ]
								displaying: 'Cuentas Filtradas'
								applying: [ :label | label addClass bootstrap3 screenReaderOnly ]
								boundTo: filteredAccountsListBox
								applying: [  ]) )
			]
		applying: [  ]
]

{ #category : #rendering }
AccountDashboardWebView >> renderContentOn: aCanvas [

	aCanvas
		render:
			( self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					( self componentSupplier
						fieldSetContaining:
							( self componentSupplier
								delayedViewShowing: SpinKitCircle new
								whileEvaluating: [ accountTypeDropdownList allowAnyOf: self session applicationContext availableAccountTypes ]
								thenRendering: accountTypeDropdownList )
						applying: [  ]
						withLegend: 'Tipos de cuenta'
						applying: [  ] );
				addContent: [ :canvas | canvas horizontalRule ];
				addContent:
					( self componentSupplier
						fieldSetContaining: identifiedSelection
						applying: [  ]
						withLegend: 'Cuentas filtradas'
						applying: [  ] );
				build )
]
