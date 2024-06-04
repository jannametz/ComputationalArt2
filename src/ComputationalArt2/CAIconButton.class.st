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
		'displayIcon',
		'pressed',
		'hover',
		'active'
	],
	#category : #ComputationalArt2
}

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:15'
}
CAIconButton class >> activeColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.2.
]

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:39'
}
CAIconButton class >> defaultColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.0.
]

{
	#category : #Color,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:21'
}
CAIconButton class >> hoverColor [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.05.
]

{
	#category : #'instance creation',
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
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:10'
}
CAIconButton >> baseForm: aForm [
	baseForm := aForm.
	self updateDisplayIcon.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:16'
}
CAIconButton >> displayActive [
	self color: self class activeColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:41'
}
CAIconButton >> displayDefault [
	self color: self class defaultColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:42'
}
CAIconButton >> displayHover [
	self color: self class hoverColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:34'
}
CAIconButton >> displayImageMorph: anImageMorph [
	displayIcon := anImageMorph.
	self addMorph: displayIcon.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:41'
}
CAIconButton >> displayPressed [
	self color: self class pressedColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:25'
}
CAIconButton >> drawOn: aCanvas [
	super drawOn: aCanvas.
	(self iconWidthPixel = displayIcon extent x) ifFalse: [
		self updateSize.
		self updateDisplayIcon.].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:24'
}
CAIconButton >> handlesMouseDown: anEvent [
	^true.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:07'
}
CAIconButton >> handlesMouseOver: anEvent [
	^true.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 12:14'
}
CAIconButton >> iconHeightPixel [
	| size |
	size := baseForm extent.
	^(iconWidth / ((size x asFloat) / (size y asFloat)) * Display uiScaleFactor) ceiling.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:41'
}
CAIconButton >> iconWidth: aNumber [
	iconWidth := aNumber.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 12:14'
}
CAIconButton >> iconWidthPixel [
	^ (iconWidth * Display uiScaleFactor) ceiling.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:18'
}
CAIconButton >> initialize [
	super initialize.
	active := false.
	pressed := false.
	hover := false.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:24'
}
CAIconButton >> mouseDown: anEvent [
	pressed := true.
	self updateColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:10'
}
CAIconButton >> mouseEnter: anEvent [
	hover := true.
	self updateColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:11'
}
CAIconButton >> mouseLeave: anEvent [
	hover := false.
	pressed := false.
	self updateColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:10'
}
CAIconButton >> mouseUp: anEvent [
	pressed := false.
	self updateColor.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:13'
}
CAIconButton >> padding: pad [
	self paddingTop: pad right: pad bottom: pad left: pad.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:48'
}
CAIconButton >> paddingBottomPixels [
	^(paddingBottom * Display uiScaleFactor) ceiling.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:48'
}
CAIconButton >> paddingLeftPixels [
	^(paddingLeft * Display uiScaleFactor) ceiling.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:49'
}
CAIconButton >> paddingRightPixels [
	^(paddingRight * Display uiScaleFactor) ceiling.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 10:23'
}
CAIconButton >> paddingTop: top right: right bottom: bottom left: left [
	paddingTop := top.
	paddingRight := right.
	paddingBottom := bottom.
	paddingLeft := left.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 11:49'
}
CAIconButton >> paddingTopPixels [
	^(paddingTop * Display uiScaleFactor) ceiling.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:25'
}
CAIconButton >> updateColor [
	pressed ifTrue: [
		self displayPressed.]
	ifFalse: [
		hover ifTrue: [
			self displayHover.]
		ifFalse: [
			active ifTrue: [self displayActive.]
			ifFalse: [self displayDefault.].
			].
		].
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:19'
}
CAIconButton >> updateDisplayIcon [
	displayIcon image: (baseForm magnifyBy:
		((self iconWidthPixel asFloat) / (baseForm extent x asFloat))).
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 13:35'
}
CAIconButton >> updateSize [
	self extent: (self paddingRightPixels + self iconWidthPixel + self paddingLeftPixels)@(self paddingTopPixels + self iconHeightPixel + self paddingBottomPixels).
	displayIcon position: self position + (self paddingLeftPixels@self paddingTopPixels).
	
	
]
