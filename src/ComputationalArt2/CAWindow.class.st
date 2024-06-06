Class {
	#name : #CAWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'activeTool',
		'canvasContainer'
	],
	#category : #ComputationalArt2
}

{
	#category : #creation,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 19:12'
}
CAWindow class >> create [

	| window canvas menuHeight textField menuRow buttonContainer canvasToolVBox simButtons simVBox |	
	window := CAWindow labelled: 'Computational Art'.
	window activeTool: CAMoveTool new.
	window minimumExtent: 700@400.
	
	menuHeight := (self uiIconButtonPadding * 2 + self uiIconButtonWidth)  * Display uiScaleFactor.
	
	buttonContainer := CAToolContainer create: window.
	canvas := CACanvasContainer newWith: window.
	canvasToolVBox := self createVBox.
	canvasToolVBox addMorph: buttonContainer.
	canvasToolVBox addMorph: (CAVSpace new dpiHeight: CAWindow uiSpacing).
	canvasToolVBox addMorph: canvas.
	canvasToolVBox minimumExtent: 300@300.
	
	menuRow := self createMenu.
	
	textField := PluggableTextMorph on: nil text: nil accept: nil.
	textField vResizing: #spaceFill.
	textField hResizing: #spaceFill.
	
	simButtons := self createSimulationsButtons.
	simVBox := self createVBox.
	simVBox addMorph: simButtons.
	simVBox addMorph: (CAVSpace new dpiHeight: CAWindow uiSpacing).
	simVBox addMorph: textField.
	simVBox minimumExtent: 200@300.
	
	window addMorph: simVBox fullFrame:
		(LayoutFrame fractions: (0.6@0.0 corner: 1.0@1) offsets: (0@menuHeight extent: 0@(-1 * (menuHeight)))).
		
	window addMorph: menuRow fullFrame:
		(LayoutFrame fractions: (0.0@0.0 corner: 1.0@0.0) offsets: (0@0 extent: 0@menuHeight)).
		
 	window addMorph: canvasToolVBox fullFrame:
		(LayoutFrame fractions: (0.0@0.0 corner: 0.6@1) offsets: (0@menuHeight extent: 0@(-1 * (menuHeight)))).
	
	window canvasContainer: canvas.
	
	window openInWorld.
	^ window
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 14:51'
}
CAWindow class >> createHBox [
	| hbox |
	hbox := Morph new.
	hbox extent: 0@0;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		color: Color transparent;
		listDirection: #leftToRight;
		borderWidth: 0;
		layoutInset: 0;
		cellInset: 0;
		layoutPolicy: TableLayout new.
	^hbox.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 14:18'
}
CAWindow class >> createHSpaceFiller [
	| morph |
	morph := Morph new.
	morph color: Color transparent.
	morph extent: 0@0.
	morph hResizing: #spaceFill.
	morph vResizing: #rigid.
	^morph.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 12:52'
}
CAWindow class >> createMenu [
	| assetLoader hBox |
	hBox := CAWindow createHBox.
	hBox color: CAWindow uiDarkerBackground.
	assetLoader := GitAssetLoader for: 'ComputationalArt2'.
	{CAExportImageFeature. CAImportImageFeature. CAExportFeature. CAImportFeature. } do: [:Tool | | button |
		button := Tool createFeatureButton.
		hBox addMorph: button.
		(Tool featureName = 'Reset' or: Tool featureName = 'Start') ifTrue:[
			hBox addMorph: CAWindow createHSpaceFiller.].].
	^hBox.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 16:23'
}
CAWindow class >> createSimulationsButtons [
	| hBox assetLoader |
	hBox := CAWindow createHBox.
	hBox color: CAWindow uiDarkerBackground.
	assetLoader := GitAssetLoader for: 'ComputationalArt2'.
	{CAResetFeature. CAPauseFeature. CAStartFeature. CAStepFeature} do: [:Tool | | button |
		button := Tool createFeatureButton.
		hBox addMorph: button.
		(Tool featureName = 'Reset' or: Tool featureName = 'Start') ifTrue:[
			hBox addMorph: CAWindow createHSpaceFiller.].].
	^hBox.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 14:52'
}
CAWindow class >> createVBox [
	| vbox |
	vbox := Morph new.
	vbox extent: 0@0;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		color: Color transparent;
		listDirection: #topToBottom;
		borderWidth: 0;
		layoutInset: 0;
		cellInset: 0;
		layoutPolicy: TableLayout new.
	^vbox.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 17:30'
}
CAWindow class >> uiDarkerBackground [
	^Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.1.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 18:55'
}
CAWindow class >> uiIconButtonPadding [
	^6.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 18:55'
}
CAWindow class >> uiIconButtonWidth [
	^16.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 16:17'
}
CAWindow class >> uiSpacing [
	^4.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:33'
}
CAWindow >> activeTool [
	^activeTool.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/2/2024 13:39'
}
CAWindow >> activeTool: aTool [
	activeTool := aTool.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 12:38'
}
CAWindow >> canvasContainer [
	^ canvasContainer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/5/2024 12:38'
}
CAWindow >> canvasContainer: aCanvasContainer [
	canvasContainer := aCanvasContainer.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 00:25'
}
CAWindow >> paneColor [
	^self defaultColor.
]
