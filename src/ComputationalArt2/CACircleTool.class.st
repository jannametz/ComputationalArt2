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
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CACircleTool class >> featureName [
	^'Circle'.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'iss 6/7/2024 11:44'
}
CACircleTool >> drawCircleFrom: startPoint to: endPoint on: aCACanvasContainer [
	| center radius angle stepAngle x y prevPoint |
	center := (startPoint + endPoint) // 2.
	radius := (startPoint dist: endPoint) // 2.
	stepAngle := (2 * Float pi) / self numberOfSteps.
	prevPoint := center + (radius @ 0).
	
	1 to: self numberOfSteps do: [:i |
		angle := i * stepAngle.
		x := center x + (radius * (angle cos)).
		y := center y + (radius * (angle sin)).
		
		aCACanvasContainer canvas drawLine: prevPoint to: (x@y) width: 1 color: Color black.
        prevPoint := (x@y)
].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 11:27'
}
CACircleTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 11:27'
}
CACircleTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	self drawCircleFrom: startPoint to: (aCACanvasContainer getPixelPosition: anEvent position) on: aCACanvasContainer.
	startPoint := nil.
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
