Class {
	#name : #CAHSpace,
	#superclass : #Morph,
	#instVars : [
		'dpiWidth'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 15:39'
}
CAHSpace >> dpiWidth: aNumber [
	dpiWidth := aNumber.
	self changed.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 15:39'
}
CAHSpace >> drawOn: aCanvas [
	| w |
	w := (dpiWidth * Display uiScaleFactor) rounded.
	w = self extent x ifFalse: [
		self extent: w@0.].
	super drawOn: aCanvas.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 15:38'
}
CAHSpace >> initialize [
	super initialize.
	dpiWidth := 1.
	self color: Color transparent.
]
