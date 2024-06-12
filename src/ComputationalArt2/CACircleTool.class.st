"
CACircleTool used to draw circles on the canvas.
"
Class {
	#name : #CACircleTool,
	#superclass : #CACanvasTool,
	#instVars : [
		'startPoint'
	],
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:48'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/9/2024 02:24'
}
CACircleTool class >> createContextBox: aCAWindow [
	| hBox |
	hBox := CAWindow createHBox.
	hBox addMorph: (CAWindow createToolFillContextMorph: aCAWindow);
	addMorph: (CAHSpace new dpiWidth: CAWindow uiContextBoxSpacing);
		addMorph: (CAWindow createToolStrokeContextMorph: aCAWindow);
		addMorph: (CAHSpace new dpiWidth: CAWindow uiContextBoxSpacing);
		addMorph: (CAWindow createToolStrokeWidthContextMorph: aCAWindow).
	^hBox.
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CACircleTool class >> toolName [
	^'Circle'.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'iss 6/12/2024 18:37'
}
CACircleTool >> drawCircleFrom: startPoint to: endPoint on: aCACanvasContainer [
	| center radius |
	center := (startPoint + endPoint) // 2.
	radius := (startPoint dist: endPoint) // 2.
	
	(aCACanvasContainer caWindow toolFill) ifTrue: [
		aCACanvasContainer canvas fillCircleAt: center radius: radius color: Color black
		] ifFalse: [
			aCACanvasContainer canvas drawCircleOutlineAt: center radius: radius color: Color black
			].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/12/2024 17:39'
}
CACircleTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/12/2024 17:38'
}
CACircleTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	self drawCircleFrom: startPoint to: (aCACanvasContainer getPixelPosition: anEvent position) on: aCACanvasContainer.
	startPoint := nil.
	
	aCACanvasContainer updateForm.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'iss 6/7/2024 11:15'
}
CACircleTool >> initialize [
	super initialize.
	startPoint := nil.
]

{
	#category : #private,
	#'squeak_changestamp' : 'iss 6/7/2024 11:43'
}
CACircleTool >> numberOfSteps [
	^100
]
