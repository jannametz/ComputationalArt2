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
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 13:40'
}
CACanvas >> drawLine: aStartPoint to: anEndPoint width: aLineWidth color: aColor [

	stagedCanvas line: aStartPoint to: anEndPoint
		width: defaultColor color: aColor.
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
