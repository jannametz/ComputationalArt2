Class {
	#name : #CACanvasTool,
	#superclass : #CAClickableFeature,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 14:00'
}
CACanvasTool class >> createToolButton: aCAToolContainer [
	| button |
	button := CAToolButton newWithClass: self conainer: aCAToolContainer iconWidth: CAWindow uiIconButtonWidth padding: CAWindow uiIconButtonPadding.
	self setupButton: button.
	^button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 15:56'
}
CACanvasTool >> handleMouseClick: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:54'
}
CACanvasTool >> handleMouseDown: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:55'
}
CACanvasTool >> handleMouseMove: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:55'
}
CACanvasTool >> handleMouseUp: anEven on: aCACanvasContainer [
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:55'
}
CACanvasTool >> handleMouseWheel: anEven on: aCACanvasContainer [
	
]
