"
CAPenTool is used to draw freehand lines on the canvas.
"
Class {
	#name : #CAPenTool,
	#superclass : #CACanvasTool,
	#instVars : [
		'isDrawing'
	],
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:50'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CAPenTool class >> featureName [
	^'Pen'.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 10:31'
}
CAPenTool >> drawAt: aPoint on: aCACanvasContainer [
	| color |
	color := Color black.
	aCACanvasContainer canvas drawPoint: aPoint color: color.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:34'
}
CAPenTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	isDrawing := true.
	self drawAt: (aCACanvasContainer getPixelPosition: anEvent position) on: aCACanvasContainer.

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 10:33'
}
CAPenTool >> handleMouseMove: anEvent on: aCACanvasContainer [
	isDrawing ifTrue: [
		self drawAt: (aCACanvasContainer getPixelPosition: anEvent position) on: aCACanvasContainer.
		].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:32'
}
CAPenTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	isDrawing := false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:36'
}
CAPenTool >> initialize [
	super initialize.
	isDrawing := false.
]
