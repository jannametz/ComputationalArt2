Class {
	#name : #CACanvas,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'depth',
		'stagedCanvas',
		'stableCanvas',
		'defaultColor'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:58'
}
CACanvas class >> new: aWidth height: aHeight [
	^ self new: aWidth height: aHeight depth: Display depth.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:57'
}
CACanvas class >> new: aWidth height: aHeight depth: aDepth [
	^ CACanvas new width: aWidth; height: aHeight; depth: aDepth.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:36'
}
CACanvas >> clearColor: aColor [

	stagedCanvas form fillWithColor: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:17'
}
CACanvas >> colorAt: aPosition [

	^ self form colorAt: aPosition.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 12:52'
}
CACanvas >> colorsFrom: aStartPosition to: anEndPosition [

	| colorsMatrix endX endY startX startY |
	startX := aStartPosition x.
	startY := aStartPosition y.
	endX := anEndPosition x.
	endY := anEndPosition y.

	colorsMatrix := Array new: endX - startX + 1.
    
	 (startX to: endX) do: [ :x |
		| column |
		column := Array new: endY - startY + 1.
	        
		(startY to: endY) do: [ :y |
	            | color |
	            color := self colorAt: x@y.
	            column at: (y - startY + 1) put: color.
	        ].
	        
	        colorsMatrix at: (x - startX + 1) put: column.
		].
	
	^ colorsMatrix.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:31'
}
CACanvas >> commit [
	
	stableCanvas setForm: stagedCanvas form deepCopy.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:49'
}
CACanvas >> create [
	
	stableCanvas := FormCanvas extent:
	(self width)@(self height)depth: (self depth).
	stagedCanvas := FormCanvas extent:
	(self width)@(self height) depth: (self depth).
	
	self clearColor: defaultColor.
	self commit.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:55'
}
CACanvas >> depth [
	^ depth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:25'
}
CACanvas >> depth: aDepth [
	depth := aDepth.
]

{
	#category : #api,
	#'squeak_changestamp' : 'iss 6/12/2024 18:35'
}
CACanvas >> drawCircleOutlineAt: center radius: radius color: aColor [
	| angle stepAngle prevPoint x y |
	stepAngle := (2 * Float pi) / 100.
	prevPoint := center + (radius @ 0).
	
	1 to: 100 do: [:i |
		angle := i * stepAngle.
		x := center x + (radius * (angle cos)).
		y := center y + (radius * (angle sin)).
		self drawLine: prevPoint to: (x @ y) width: 1 color: aColor.
		prevPoint := (x @ y).
		].
]

{
	#category : #api,
	#'squeak_changestamp' : 'iss 6/7/2024 11:09'
}
CACanvas >> drawLine: aStartPoint to: anEndPoint width: aLineWidth color: aColor [

	stagedCanvas line: aStartPoint to: anEndPoint
		width: 1 color: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:39'
}
CACanvas >> drawPoint: aPoint color: aColor [

	stagedCanvas point: aPoint color: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:36'
}
CACanvas >> drawRect: aRectangle color: aColor [

	stagedCanvas fillRectangle: aRectangle color: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:36'
}
CACanvas >> drawRect: aStartPoint to: anEndPoint color: aColor [

	stagedCanvas fillRectangle:
		(Rectangle origin: aStartPoint corner: anEndPoint) color: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'iss 6/12/2024 18:33'
}
CACanvas >> fillCircleAt: center radius: radius color: aColor [
	| dx dy |
	(center x - radius to: center x + radius) do: [:x |
		(center y - radius to: center y + radius) do: [:y |
			dx := x - center x.
			dy := y - center y.
			((dx * dx) + (dy * dy) <= (radius * radius)) ifTrue: [
				self drawPoint: (x @ y) color: aColor.
				].
			].
		].
]

{
	#category : #api,
	#'squeak_changestamp' : 'iss 6/11/2024 16:49'
}
CACanvas >> fillFrom: startPoint withColor: aColor [

	| stack oldColor |
	oldColor := self colorAt: startPoint.
	(oldColor = aColor) ifTrue: [ ^self ].
	
	stack := OrderedCollection new.
	stack add: startPoint.
	
	[ stack isEmpty ] whileFalse: [
		| point neighbors |
		point := stack removeLast.
		(self colorAt: point) = oldColor ifTrue: [
			self drawPoint: point color: aColor.
			neighbors := { point + (1@0). point - (1@0). point + (0@1). point - (0@1) }.
			neighbors do: [ :neighbor |
				(self isInBounds: neighbor) ifTrue: [ stack add: neighbor ].
			].
		].
	].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:32'
}
CACanvas >> form [
	^ stagedCanvas form.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:22'
}
CACanvas >> height [
	^ height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:22'
}
CACanvas >> height: aHeight [
	height := aHeight
	"apply height change to canvas"
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:49'
}
CACanvas >> initialize [

	defaultColor := Color gray.
]

{
	#category : #api,
	#'squeak_changestamp' : 'iss 6/11/2024 16:44'
}
CACanvas >> isInBounds: aPoint [
	^(aPoint x >= 0 and: [ aPoint x < self width ])
	and: [ aPoint y >= 0 and: [ aPoint y < self height ]].
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:32'
}
CACanvas >> reset [

	stagedCanvas setForm: stableCanvas form deepCopy.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:55'
}
CACanvas >> width [
	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:23'
}
CACanvas >> width: aWidth [
	width := aWidth
	"apply width change to canvas"
]
