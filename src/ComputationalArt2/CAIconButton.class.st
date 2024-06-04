Class {
	#name : #CAIconButton,
	#superclass : #Morph,
	#instVars : [
		'baseForm',
		'iconWidth',
		'paddingTop',
		'paddingRight',
		'paddingBottom',
		'paddingLeft',
		'displayIcon'
	],
	#category : #ComputationalArt2
}

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:39'
}
CAIconButton class >> defaultColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.0.
]

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:40'
}
CAIconButton class >> hoverColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:39'
}
CAIconButton class >> newWith: aForm iconWidth: width padding: padding [
	| button |
	button := CAIconButton new.
	button color: self defaultColor.
	button displayImageMorph:ImageMorph new.
	button iconWidth: width.
	button padding: padding.
	button baseForm: aForm.
	button updateSize.
	^button.
]

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:40'
}
CAIconButton class >> pressedColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.2.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:10'
}
CAIconButton >> baseForm: aForm [
	baseForm := aForm.
	self updateDisplayIcon.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:41'
}
CAIconButton >> displayDefault [
	self color: self class defaultColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:42'
}
CAIconButton >> displayHover [
	self color: self class hoverColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:34'
}
CAIconButton >> displayImageMorph: anImageMorph [
	displayIcon := anImageMorph.
	self addMorph: displayIcon.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:41'
}
CAIconButton >> displayPressed [
	self color: self class pressedColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:25'
}
CAIconButton >> drawOn: aCanvas [
	super drawOn: aCanvas.
	(self iconWidthPixel = displayIcon extent x) ifFalse: [
		self updateSize.
		self updateDisplayIcon.].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 12:14'
}
CAIconButton >> iconHeightPixel [
	| size |
	size := baseForm extent.
	^(iconWidth / ((size x asFloat) / (size y asFloat)) * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:41'
}
CAIconButton >> iconWidth: aNumber [
	iconWidth := aNumber.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 12:14'
}
CAIconButton >> iconWidthPixel [
	^ (iconWidth * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:13'
}
CAIconButton >> padding: pad [
	self paddingTop: pad right: pad bottom: pad left: pad.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:48'
}
CAIconButton >> paddingBottomPixels [
	^(paddingBottom * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:48'
}
CAIconButton >> paddingLeftPixels [
	^(paddingLeft * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:49'
}
CAIconButton >> paddingRightPixels [
	^(paddingRight * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 10:23'
}
CAIconButton >> paddingTop: top right: right bottom: bottom left: left [
	paddingTop := top.
	paddingRight := right.
	paddingBottom := bottom.
	paddingLeft := left.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:49'
}
CAIconButton >> paddingTopPixels [
	^(paddingTop * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:19'
}
CAIconButton >> updateDisplayIcon [
	displayIcon image: (baseForm magnifyBy:
		((self iconWidthPixel asFloat) / (baseForm extent x asFloat))).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:35'
}
CAIconButton >> updateSize [
	self extent: (self paddingRightPixels + self iconWidthPixel + self paddingLeftPixels)@(self paddingTopPixels + self iconHeightPixel + self paddingBottomPixels).
	displayIcon position: self position + (self paddingLeftPixels@self paddingTopPixels).
	
	
]
