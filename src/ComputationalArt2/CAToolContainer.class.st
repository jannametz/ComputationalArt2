Class {
	#name : #CAToolContainer,
	#superclass : #Morph,
	#instVars : [
		'activeButton',
		'toolRow',
		'contextRow',
		'caWindow'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:44'
}
CAToolContainer class >> create: aCAWindow [
	
	| toolContainer toolRow contextRow stringMorph textMorph |
	toolContainer := CAToolContainer new.
	toolContainer caWindow: aCAWindow.
	
	toolRow := CAWindow createHBox.
	toolRow color: CAWindow uiDarkerBackground.
	
	contextRow := CAWindow createHBox.
	contextRow color: CAWindow uiDarkerBackground.
	
	{CARedoFeature. CAUndoFeature.} do: [:Tool | | b |
		b := Tool createFeatureButton: aCAWindow.
		b name: Tool featureName.
		contextRow addMorph: b.].
	contextRow addMorph: CAWindow createHSpaceFiller.
	
	stringMorph := CAStringMorph new.
	stringMorph contents: 'This is the text to display'.
	stringMorph color: Color red.
	stringMorph vResizing: #shrinkWrap.
	stringMorph hResizing: #shrinkWrap.
	textMorph := TextMorph new.
	textMorph contents: '1'.
	textMorph vResizing: #shrinkWrap.
	contextRow addMorph: textMorph.
	contextRow addMorph: stringMorph.
	
	toolContainer contextRow: contextRow.
	toolContainer addMorph: (CAVSpace new dpiHeight: CAWindow uiSpacing).
	toolContainer toolRow: toolRow.
	
	{CAResetCanvasTool. CAFloodFillTool. CACircleTool. CARectangleTool. CALineTool. CAPenTool. CAMoveTool.} do: [:Tool | | b |
		b := Tool createToolButton: toolContainer.
		b name: Tool toolName.
		toolRow addMorph: b.].
	
	toolContainer setActiveClass: CAMoveTool.
	^toolContainer.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 14:30'
}
CAToolContainer >> caWindow: aCAWindow [
	caWindow := aCAWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 14:27'
}
CAToolContainer >> contextRow: aMorph [
	contextRow := aMorph.
	self addMorph: aMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 17:35'
}
CAToolContainer >> initialize [
	super initialize.
	self extent: 0@0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listDirection: #topToBottom;
		wrapCentering: #center;
		layoutInset: 0;
		cellInset: 0;
		borderWidth: 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 14:27'
}
CAToolContainer >> setActiveButton: aCAToolButton [
	activeButton = nil ifFalse: [activeButton active: false].
	activeButton := aCAToolButton.
	activeButton active: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:37'
}
CAToolContainer >> setActiveClass: aCACanvasToolClass [
	self setActiveButton: (toolRow submorphNamed: aCACanvasToolClass toolName).
	caWindow activeTool: aCACanvasToolClass new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 14:05'
}
CAToolContainer >> toolRow: aMorph [
	toolRow := aMorph.
	self addMorph: aMorph.
]
