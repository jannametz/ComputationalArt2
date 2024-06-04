Class {
	#name : #CAMoveTool,
	#superclass : #CATool,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/3/2024 18:57'
}
CAMoveTool class >> toolName [
	^'Move'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 14:11'
}
CAMoveTool >> handleMouseMove: anEvent on: aCACanvasContainer [
	| delta |
	anEvent anyButtonPressed ifTrue: [
		delta := anEvent position - anEvent startPoint.
		aCACanvasContainer canvasOffset: (aCACanvasContainer canvasOffset + delta).].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/3/2024 18:31'
}
CAMoveTool >> handleMouseWheel: anEvent on: aCACanvasContainer [
	| deltaY currentScale newScale mousePosition currentMouseCanvasOffset newMouseCanvasOffset currentCanvasOffset newCanvasOffset |
	
	currentScale := aCACanvasContainer canvasScale asFloat.
	deltaY := anEvent wheelDelta y / 400.0 * currentScale.
	newScale := aCACanvasContainer clampScale: (currentScale + deltaY).
	mousePosition := anEvent position - aCACanvasContainer position.
	currentCanvasOffset := aCACanvasContainer canvasOffset.
	currentMouseCanvasOffset := currentCanvasOffset - mousePosition.
	newMouseCanvasOffset := currentMouseCanvasOffset * (newScale / currentScale).
	newCanvasOffset := mousePosition + newMouseCanvasOffset.
	
	aCACanvasContainer canvasOffset: newCanvasOffset scale: newScale.
	
	
	
]