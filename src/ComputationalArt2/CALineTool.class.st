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
	#'squeak_changestamp' : 'iss 6/13/2024 16:32'
}
CALineTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	aCACanvasContainer canvas saveState.
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.
	aCACanvasContainer canvas commit.
	aCACanvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 21:15'
}
CALineTool >> handleMouseMove: anEvent on: aCACanvasContainer [

	startPoint ifNotNil: [ | endPoint caWindow |
		caWindow := aCACanvasContainer caWindow.
		aCACanvasContainer canvas reset.
		endPoint := aCACanvasContainer getPixelPosition: anEvent position.
		aCACanvasContainer canvas drawLine: startPoint to: endPoint width: caWindow toolStrokeWidth color: caWindow primaryColor morphicColor.
		aCACanvasContainer updateForm.].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 21:16'
}
CALineTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	| endPoint caWindow |
	endPoint := aCACanvasContainer getPixelPosition: anEvent position.
	caWindow := aCACanvasContainer caWindow.
	aCACanvasContainer canvas drawLine: startPoint to: endPoint width: caWindow toolStrokeWidth color: caWindow primaryColor morphicColor.
	startPoint := nil.
	aCACanvasContainer canvas commit.
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
