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
	#'squeak_changestamp' : 'Yoan Tchorenev 6/9/2024 02:17'
}
CALineTool class >> createContextBox: aCAWindow [
	| hBox |
	hBox := CAWindow createHBox.
	hBox addMorph: (CAWindow createToolStrokeWidthContextMorph: aCAWindow).
	^hBox.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:34'
}
CALineTool class >> toolName [
	^'Line'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/12/2024 17:35'
}
CALineTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.
	aCACanvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/12/2024 17:36'
}
CALineTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	| endPoint |
	endPoint := aCACanvasContainer getPixelPosition: anEvent position.
	aCACanvasContainer canvas drawLine: startPoint to: endPoint width: 1 color: Color black.
	startPoint := nil.
	aCACanvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 10:58'
}
CALineTool >> initialize [
	super initialize.
	startPoint := nil.
]
