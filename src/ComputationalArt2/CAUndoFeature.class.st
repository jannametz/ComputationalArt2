"
CAUndoFeature allows undoing the last action on the canvas.
"
Class {
	#name : #CAUndoFeature,
	#superclass : #CAClickableFeature,
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:48'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/13/2024 16:16'
}
CAUndoFeature class >> executeFeature: aCAWindow [
	[
		aCAWindow canvasContainer canvas undo.
		aCAWindow canvasContainer updateForm.
	] on: Error do: [:ex |
		Transcript show: 'undo action failed: ', ex messageText; cr.
		].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAUndoFeature class >> featureName [
	^'Undo'.
]
