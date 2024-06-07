"
CALineTool used to draw lines on the canvas.
"
Class {
	#name : #CALineTool,
	#superclass : #CACanvasTool,
	#instVars : [
		'startPoint'
	],
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:47'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CALineTool class >> featureName [
	^'Line'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:59'
}
CALineTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 11:04'
}
CALineTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	| endPoint |
	endPoint := aCACanvasContainer getPixelPosition: anEvent position.
	aCACanvasContainer canvas drawLine: startPoint to: endPoint width: 1 color: Color black.
	startPoint := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:58'
}
CALineTool >> initialize [
	super initialize.
	startPoint := nil.
]
