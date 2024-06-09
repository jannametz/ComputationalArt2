"
CARectangleTool is used to draw rectangles on the canvas.
"
Class {
	#name : #CARectangleTool,
	#superclass : #CACanvasTool,
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
