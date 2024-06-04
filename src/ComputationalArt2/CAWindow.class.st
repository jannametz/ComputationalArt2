Class {
	#name : #CAWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'activeTool'
	],
	#category : #ComputationalArt2
}

{
	#category : #creation,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:20'
}
CAWindow class >> create [

	| window canvas buttonColum contextMenuRow contextMenuHeight menuHeight textField menuRow toolsWidth |	
	window := CAWindow labelled: 'Computational Art'.
	window activeTool: CAMoveTool new.
	window minimumExtent: 480@480.
	
	toolsWidth := CAWindow uiValue: #uiToolsWidth.
	contextMenuHeight := CAWindow uiValue: #uiMenuHeight.
	menuHeight := CAWindow uiValue: #uiMenuHeight.
	
	buttonColum := self createButtonsColumn: window.
	contextMenuRow := self createItemRow.
	menuRow := self createItemRow.
	canvas := CACanvasContainer newWith: window.
	textField := PluggableTextMorph on: nil text: nil accept: nil.
	textField minimumExtent: 50@50.
	
	window addMorph: textField fullFrame:
		(LayoutFrame fractions: (0.6@0.0 corner: 1.0@1) offsets: (0@menuHeight extent: 0@(-1 * (menuHeight + contextMenuHeight)))).
		
	window addMorph: contextMenuRow fullFrame:
		(LayoutFrame fractions: (0.0@1.0 corner: 1.0@1.0) offsets: (0@(-1 * contextMenuHeight) extent: 0@contextMenuHeight)).
		
	window addMorph: menuRow fullFrame:
		(LayoutFrame fractions: (0.0@0.0 corner: 1.0@0.0) offsets: (0@0 extent: 0@menuHeight)).
		
	window addMorph: buttonColum fullFrame:
		(LayoutFrame fractions: (0.0@0.0 corner: 0.0@1.0) offsets: (0@menuHeight extent: toolsWidth@(-1 * (menuHeight + contextMenuHeight)))).
		
 	window addMorph: canvas fullFrame:
		(LayoutFrame fractions: (0.0@0.0 corner: 0.6@1) offsets: (toolsWidth@menuHeight extent: (-1 * toolsWidth)@(-1 * (menuHeight + contextMenuHeight)))).
	
	window openInWorld.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:45'
}
CAWindow class >> createButtonsColumn: aCAWindow [
	| buttonCol |
	buttonCol := RectangleMorph new.
	buttonCol layoutPolicy: TableLayout new;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		listDirection: #topToBottom;
		wrapCentering: #center;
		layoutInset: (CAWindow uiValue: #uiToolButtonsInsets);
		cellInset: (CAWindow uiValue: #uiToolButtonsCellInsets);
		color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.1);
		borderWidth: 0.
	
	{CAPenTool. CAMoveTool.} do: [:Tool | | b |
		b := Tool createToolButton: aCAWindow.
		b name: Tool toolName.
		buttonCol addMorph: b.].
	^buttonCol
]

{
	#category : #creation,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/3/2024 23:46'
}
CAWindow class >> createItemRow [
	| buttonRow |
	buttonRow := RectangleMorph new.
	buttonRow layoutPolicy: TableLayout new;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		cellPositioning: #center;
		listDirection: #leftToRight;
		layoutInset: 0;
		cellInset: 0;
		color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.1);
		borderWidth: 0.
	^buttonRow.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:41'
}
CAWindow class >> uiIconButtonPadding [
	^5.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:39'
}
CAWindow class >> uiIconButtonWidth [
	^24.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:52'
}
CAWindow class >> uiMenuHeight [
	^32.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:33'
}
CAWindow class >> uiToolButtonsCellInsets [
	^0.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:33'
}
CAWindow class >> uiToolButtonsInsets [
	^0.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 16:40'
}
CAWindow class >> uiToolsWidth [
	^38.
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:29'
}
CAWindow class >> uiValue: aSymbol [
	^(self perform: aSymbol) * Display uiScaleFactor.
	
]

{
	#category : #ui,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 14:29'
}
CAWindow class >> uiValueDirect: aSymbol [
	^(self perform: aSymbol).
	
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
	#'squeak_changestamp' : 'Yoan Tchorenev 6/4/2024 00:25'
}
CAWindow >> paneColor [
	^self defaultColor.
]
