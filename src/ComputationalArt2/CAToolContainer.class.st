Class {
	#name : #CAToolContainer,
	#superclass : #Morph,
	#instVars : [
		'activeTool'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/5/2024 18:18'
}
CAToolContainer class >> create: aCAWindow [
	
	| toolContainer toolRow contextRow |
	toolContainer := CAToolContainer new.
	
	toolRow := CAWindow createHBox.
	toolRow color: CAWindow uiDarkerBackground.
	
	contextRow := CAWindow createHBox.
	contextRow color: CAWindow uiDarkerBackground.
	
	{CARedoTool. CAUndoTool.} do: [:Tool | | b |
		b := Tool createToolButton.
		b name: Tool toolName.
		contextRow addMorph: b.].
	contextRow addMorph: CAWindow createHSpaceFiller.
	
	toolContainer addMorph: contextRow.
	toolContainer addMorph: (CAVSpace new dpiHeight: CAWindow uiSpacing).
	toolContainer addMorph: toolRow.
	
	{CAResetCanvasTool. CACircleTool. CARectangleTool. CALineTool. CAPenTool. CAMoveTool.} do: [:Tool | | b |
		b := Tool createToolButton.
		b name: Tool toolName.
		toolRow addMorph: b.].
	
	^toolContainer.
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
