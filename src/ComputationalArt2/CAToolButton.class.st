Class {
	#name : #CAToolButton,
	#superclass : #CAIconButton,
	#instVars : [
		'toolClass',
		'toolContainer'
	],
	#category : #'ComputationalArt2-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:40'
}
CAToolButton class >> newWithClass: aCAToolClass conainer: aCAToolContainer iconWidth:width padding: padding [
	| button |
	button := CAToolButton new.
	button toolClass: aCAToolClass.
	button toolContainer: aCAToolContainer.
	button color: self defaultColor.
	button displayImageMorph:ImageMorph new.
	button iconWidth: width.
	button padding: padding.
	button baseForm: aCAToolClass buttonForm.
	button onClick: [aCAToolContainer setActiveClass: aCAToolClass.].
	button updateSize.
	^button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 13:27'
}
CAToolButton >> toolClass: aToolClass [
	toolClass := aToolClass.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 13:34'
}
CAToolButton >> toolContainer: aCAToolContainer [
	toolContainer := aCAToolContainer.
]