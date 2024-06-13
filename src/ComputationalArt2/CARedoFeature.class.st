"
CARedoFeature redoes the last undone action on the canvas.
"
Class {
	#name : #CARedoFeature,
	#superclass : #CAClickableFeature,
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:51'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/13/2024 16:16'
}
CARedoFeature class >> executeFeature: aCAWindow [
	[
		aCAWindow canvasContainer canvas redo.
		aCAWindow canvasContainer updateForm.
	] on: Error do: [:ex |
		Transcript show: 'undo action failed: ', ex messageText; cr.
		].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CARedoFeature class >> featureName [
	^'Redo'.
]
