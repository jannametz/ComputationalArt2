Class {
	#name : #CAClickableFeature,
	#superclass : #Object,
	#instVars : [
		'caWindow',
		'toolName'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 13:46'
}
CAClickableFeature class >> buttonForm [
	^((GitAssetLoader for: 'ComputationalArt2') loadImageMorph: 'assets\img\tools\',self featureName,'.png') form.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 13:53'
}
CAClickableFeature class >> createFeatureButton [
	| button |
	button := CAIconButton newWith: self buttonForm iconWidth: CAWindow uiIconButtonWidth padding: CAWindow uiIconButtonPadding.
	self setupButton: button.
	^button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CAClickableFeature class >> featureName [
	^'Tool'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:25'
}
CAClickableFeature class >> newWith: aCAWindow [
	^self new caWindow: aCAWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 13:53'
}
CAClickableFeature class >> setupButton: aCAIconButton [
	aCAIconButton balloonText: self featureName.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:25'
}
CAClickableFeature >> caWindow: aCAWindow [
	caWindow := aCAWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:46'
}
CAClickableFeature >> featureName [
	^self class featureName.
]
