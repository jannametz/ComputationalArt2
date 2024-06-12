Class {
	#name : #CAImportFeature,
	#superclass : #CAClickableFeature,
	#category : #ComputationalArt2
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Tyron Franzke 6/12/2024 18:53'
}
CAImportFeature class >> executeFeature: aCAWindow [
	Transcript show: 'Importing project'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Yoan Tchorenev 6/6/2024 23:33'
}
CAImportFeature class >> featureName [
	^'Import'.
]
