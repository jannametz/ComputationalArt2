Class {
	#name : #CARGB,
	#superclass : #Object,
	#instVars : [
		'red',
		'green',
		'blue'
	],
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:25'
}
CARGB class >> chanelTo8Bit: aNumber [
	^(((aNumber * 256.0) floor) min: 255).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:59'
}
CARGB class >> newFrom: aColor [
	| color |
	color := self new.
	color red: (self chanelTo8Bit: aColor red).
	color green: (self chanelTo8Bit: aColor green).
	color blue:  (self chanelTo8Bit: aColor blue).
	^color.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:40'
}
CARGB >> = aCARGB [
	^red = aCARGB red and: green = aCARGB green and blue = aCARGB blue.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:12'
}
CARGB >> blue [
	^ blue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:36'
}
CARGB >> blue: aNumber [
	blue := (aNumber rounded) min: 255 max: 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:12'
}
CARGB >> green [
	^ green
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:36'
}
CARGB >> green: aNumber [
	green := (aNumber rounded) min: 255 max: 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:10'
}
CARGB >> initialize [
	red := 0.
	green := 0.
	blue := 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:11'
}
CARGB >> morphicColor [
	^Color r: red / 255.0 g: green / 255.0 b: blue / 255.0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:12'
}
CARGB >> red [
	^ red
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Yoan Tchorenev 6/18/2024 19:36'
}
CARGB >> red: aNumber [
	red  := (aNumber rounded) min: 255 max: 0.
]
