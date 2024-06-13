"
CARectangleTool is used to draw rectangles on the canvas.
"
Class {
	#name : #CARectangleTool,
	#superclass : #CACanvasTool,
	#instVars : [
		'startPoint'
	],
	#category : #ComputationalArt2,
	#'squeak_changestamp' : 'iss 6/7/2024 11:53'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/9/2024 02:24'
}
CARectangleTool class >> createContextBox: aCAWindow [
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
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:34'
}
CARectangleTool class >> toolName [
	^'Rectangle'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Halfil 6/12/2024 21:58'
}
CARectangleTool >> drawOutlineOfRect: rect on: aCACanvasContainer withColor: color [
    | topEdge bottomEdge leftEdge rightEdge borderWidth |
    borderWidth := 1. 
    topEdge := Rectangle origin: rect topLeft extent: rect width @ borderWidth.
    bottomEdge := Rectangle origin: rect bottomLeft - (0 @ borderWidth) extent: rect width @ borderWidth.
    leftEdge := Rectangle origin: rect topLeft extent: borderWidth @ rect height.
    rightEdge := Rectangle origin: rect topRight - (borderWidth @ 0) extent: borderWidth @ rect height.

    aCACanvasContainer canvas drawRect: topEdge color: color.
    aCACanvasContainer canvas drawRect: bottomEdge color: color.
    aCACanvasContainer canvas drawRect: leftEdge color: color.
    aCACanvasContainer canvas drawRect: rightEdge color: color.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Halfil 6/12/2024 22:04'
}
CARectangleTool >> drawRectangleFrom: startPoint to: endPoint on: aCACanvasContainer [
    | topLeft bottomRight width height color rect |
    topLeft := startPoint min: endPoint.
    bottomRight := startPoint max: endPoint.
    width := bottomRight x - topLeft x.
    height := bottomRight y - topLeft y.
    color := aCACanvasContainer caWindow paneColor.
    rect := Rectangle origin: topLeft extent: width @ height.

    (aCACanvasContainer caWindow toolFill) ifTrue: [
        aCACanvasContainer canvas drawRect: rect color: color  "This fills the rectangle"
    ] ifFalse: [
        "This condition should handle the scenario when only the outline needs to be drawn."
        "Currently, we simulate the outline by manipulating the rect dimensions if no native outline method exists."
        self drawOutlineOfRect: rect on: aCACanvasContainer withColor: color
    ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/13/2024 10:47'
}
CARectangleTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	
	aCACanvasContainer canvas commit.
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/13/2024 10:47'
}
CARectangleTool >> handleMouseMove: anEvent on: aCACanvasContainer [
	
	startPoint ifNotNil: [ | endPoint |
		aCACanvasContainer canvas reset.
		endPoint := aCACanvasContainer getPixelPosition: anEvent position.
		self drawRectangleFrom: startPoint to: endPoint on: aCACanvasContainer.
		aCACanvasContainer updateForm.
		].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/13/2024 10:48'
}
CARectangleTool >> handleMouseUp: anEvent on: aCACanvasContainer [
    
	| endPoint |
	endPoint := aCACanvasContainer getPixelPosition: anEvent position.
	self drawRectangleFrom: startPoint to: endPoint on: aCACanvasContainer.
	startPoint := nil.
	aCACanvasContainer canvas commit.
	aCACanvasContainer updateForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Halfil 6/12/2024 21:41'
}
CARectangleTool >> initialize [
    super initialize.
    startPoint := nil.

]
