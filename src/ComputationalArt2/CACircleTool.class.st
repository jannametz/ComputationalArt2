Class {
	#name : #CACircleTool,
	#superclass : #CACanvasTool,
	#instVars : [
		'startPoint'
	],
	#category : #ComputationalArt2
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
	#'squeak_changestamp' : 'iss 6/7/2024 11:25'
}
CACircleTool >> drawCircleFrom: startPoint to: endPoint on: aCACanvasContainer [
	| center radius steps angle stepAngle x y prevPoint |
	center := (startPoint + endPoint) // 2.
	radius := (startPoint dist: endPoint) // 2.
	steps := 100.
	stepAngle := (2 * Float pi) / steps.
	prevPoint := center + (radius @ 0).
	
	1 to: steps do: [:i |
		angle := i * stepAngle.
		x := center x + (radius * (angle cos)).
		y := center y + (radius * (angle sin)).
		
		aCACanvasContainer canvas drawLine: prevPoint to: (x@y) width: 1 color: Color black.
        prevPoint := (x@y)
].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 11:15'
}
CACircleTool >> handleMouseDown: anEvent on: aCACanvasContainer [
	startPoint := aCACanvasContainer getPixelPosition: anEvent position.

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'iss 6/7/2024 11:15'
}
CACircleTool >> handleMouseUp: anEvent on: aCACanvasContainer [
	self drawCircleFrom: startPoint to: (aCACanvasContainer getPixelPosition: anEvent position) on: aCACanvasContainer.
	startPoint := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'iss 6/7/2024 11:15'
}
CACircleTool >> initialize [
	super initialize.
	startPoint := nil.
]
