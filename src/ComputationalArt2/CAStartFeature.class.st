"
CAStartFeature starts a process or simulation on the canvas.
"
Class {
	#name : #CAStartFeature,
	#superclass : #CAClickableFeature,
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:53'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KH 6/22/2024 16:29'
}
CAStartFeature class >> executeFeature: aCAWindow [
	| block |
	block := Compiler evaluate: '[:canvas | ', aCAWindow scriptField text,']'.
	block value: aCAWindow canvasContainer canvas.
	
	aCAWindow canvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAStartFeature class >> featureName [
	^'Start'.
]
