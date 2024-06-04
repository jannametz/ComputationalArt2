Class {
	#name : #CATool,
	#superclass : #Object,
	#instVars : [
		'caWindow',
		'toolName'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:32'
}
CATool class >> createToolButton: aCAWindow [
	| button assetLoader form |
	assetLoader := GitAssetLoader for: 'ComputationalArt2'.
	form := (assetLoader loadImageMorph: 'assets\img\tools\',self toolName,'.png') form.
	button := CAIconButton newWith: form
	iconWidth: (CAWindow uiValueDirect: #uiIconButtonWidth)
	padding: (CAWindow uiValueDirect: #uiIconButtonPadding).
	button balloonText: self toolName, ' Tool'.
	^button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:25'
}
CATool class >> newWith: aCAWindow [
	^self new caWindow: aCAWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/3/2024 18:56'
}
CATool class >> toolName [
	^'Tool'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:25'
}
CATool >> caWindow: aCAWindow [
	caWindow := aCAWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 12:51'
}
CATool >> handleMouseClick: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 12:41'
}
CATool >> handleMouseDown: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 12:41'
}
CATool >> handleMouseMove: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 12:51'
}
CATool >> handleMouseUp: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 14:44'
}
CATool >> handleMouseWheel: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/3/2024 18:56'
}
CATool >> toolName [
	^self class toolName.
]
