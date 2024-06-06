Class {
	#name : #CAClickableFeature,
	#superclass : #Object,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAClickableFeature class >> buttonForm [
	^((GitAssetLoader for: 'ComputationalArt2') loadImageMorph: 'assets\img\tools\',self featureName,'.png') form.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAClickableFeature class >> createFeatureButton [
	| button |
	button := CAIconButton newWith: self buttonForm iconWidth: CAWindow uiIconButtonWidth padding: CAWindow uiIconButtonPadding.
	button balloonText: self featureName.
	^button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:28'
}
CAClickableFeature class >> executeFeature: aCAWindow [
	^self subclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAClickableFeature class >> featureName [
	^'Tool'
]
