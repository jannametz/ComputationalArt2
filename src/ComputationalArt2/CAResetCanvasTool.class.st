Class {
	#name : #CAResetCanvasTool,
	#superclass : #CACanvasTool,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CAResetCanvasTool class >> featureName [
	^'Reset Canvas'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:55'
}
CAResetCanvasTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	aCACanvasContainer canvas reset.
	aCACanvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:44'
}
CAResetCanvasTool >> initialize [
	super initialize.
]
