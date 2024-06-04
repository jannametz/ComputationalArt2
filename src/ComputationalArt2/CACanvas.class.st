Class {
	#name : #CACanvas,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'depth',
		'stableForm',
		'stagedForm'
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
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:42'
}
CACanvas >> colorAt: aPosition [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:42'
}
CACanvas >> colorsFrom: aStartPosition to: anEndPosition [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:10'
}
CACanvas >> commit [
	
	stableForm := stagedForm deepCopy.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:11'
}
CACanvas >> create [
	
	stableForm := FormCanvas extent: (self width)@(self height) depth: (self depth).
	stagedForm := stableForm deepCopy.
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
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:55'
}
CACanvas >> depth: aDepth [
	depth := aDepth
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:06'
}
CACanvas >> drawLineFrom: aStartPoint to: anEndPoint color: aColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:06'
}
CACanvas >> drawLineFrom: aStartPoint to: anEndPoint color: aColor replace: aFilterColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:16'
}
CACanvas >> drawPointAt: aPoint color: aColor [

	stagedForm point: aPoint color: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:06'
}
CACanvas >> drawPointAt: aPoint color: aColor replace: aFilterColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:40'
}
CACanvas >> drawString: aString at: anUpperLeftCornerPoint [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:41'
}
CACanvas >> drawString: aString at: anUpperLeftCornerPoint replace: aFilterColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:26'
}
CACanvas >> fillColor: aColor [
	
	stagedForm fillColor: aColor.
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:07'
}
CACanvas >> fillColor: aColor replace: aFilterColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:38'
}
CACanvas >> fillFrom: aStartPoint to: anEndPoint color: aColor [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:38'
}
CACanvas >> fillFrom: aStartPoint to: anEndPoint color: aColor replace: aFilterColor [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:19'
}
CACanvas >> form [
	^ stagedForm form.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:55'
}
CACanvas >> height [
	^ height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:55'
}
CACanvas >> height: aHeight [
	height := aHeight
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:11'
}
CACanvas >> initialize [
]

{
	#category : #api,
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 01:25'
}
CACanvas >> reset [
	
	stagedForm := stableForm deepCopy.
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
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 00:56'
}
CACanvas >> width: aWidth [
	width := aWidth
]
