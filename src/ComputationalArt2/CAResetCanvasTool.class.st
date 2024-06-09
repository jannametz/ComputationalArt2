Class {
	#name : #CAResetCanvasTool,
	#superclass : #CACanvasTool,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/9/2024 02:26'
}
CAResetCanvasTool class >> createContextBox: aCAWindow [
	| hBox |
	hBox := CAWindow createHBox.
	hBox addMorph: (CAStringMorph new contents: 'Reset Canvas').
	^hBox.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:34'
}
CAResetCanvasTool class >> toolName [
	^'Reset Canvas'.
]
