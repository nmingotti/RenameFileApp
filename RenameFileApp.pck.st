'From Cuis 5.0 [latest update: #4963] on 17 November 2021 at 10:28:21 am'!
'Description '!
!provides: 'RenameFileApp' 1 7!
!requires: 'Morphic-Misc1' 1 199 nil!
SystemOrganization addCategory: #RenameFileApp!


!classDefinition: #RenameFileMorph category: #RenameFileApp!
LayoutMorph subclass: #RenameFileMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'RenameFileApp'!
!classDefinition: 'RenameFileMorph class' category: #RenameFileApp!
RenameFileMorph class
	instanceVariableNames: ''!

!classDefinition: #RenameFileMorph3 category: #RenameFileApp!
SystemWindow subclass: #RenameFileMorph3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'RenameFileApp'!
!classDefinition: 'RenameFileMorph3 class' category: #RenameFileApp!
RenameFileMorph3 class
	instanceVariableNames: ''!


!RenameFileMorph commentStamp: '<historical>' prior: 0!
Try it with: 

RenameFileMorph open openInWorld . !

!RenameFileMorph3 commentStamp: '<historical>' prior: 0!
Try it with: 

RenameFileMorph open openInWorld . !

!RenameFileMorph methodsFor: 'GUI building' stamp: 'NM 11/17/2021 10:17:57'!
buildMorphicWindow
	|lay|
	lay _ self. 
	". the main layout is a colum of items "  
	lay beColumn.
	lay color: (Color white). 
	lay separation: 10@10.
	lay addMorph: self morphR1 .
	lay addMorph: self morphR2. 
	"not effective"
	"lay layoutSpec fixedHeight: 0. "
	^ self ! !

!RenameFileMorph methodsFor: 'GUI building' stamp: 'NM 11/17/2021 10:26:52'!
morphR1
	|r1 r1c1 r1c2 lab1 lab2 lab3 ent1|
	r1 _ LayoutMorph new.
	r1 beRow.
	". let this row enalrge in width, but shrink as much as possible in height "
       r1 layoutSpec proportionalWidth: 1.0.
	r1 layoutSpec fixedHeight: 0. 
	r1 color: (Color white).
	"------------ leftmost column -------------------------------  "
       r1c1 _ LayoutMorph new. 
	r1c1 beColumn.
	r1c1 separation: 10@10. 
	". force this column to be the minimum possible width "
	r1c1 layoutSpec fixedWidth: 0. 
	r1c1 layoutSpec fixedHeight: 0. 
	r1c1 color: (Color white).  
	r1 addMorph: r1c1.
	"label-1"
	lab1 _ LabelMorph new.
	lab1 contents: ' Old name: '.
	lab1 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c1 addMorph: lab1. 
	"label-2"
	lab2 _ LabelMorph new.
	lab2 contents: ' New name: '.
	lab2 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c1 addMorph: lab2. 
	" ----------------- rightmost colum ----------------------------- "
	r1c2 _ LayoutMorph new. 
	r1c2 beColumn . 
	r1c2 separation: 10@10. 
	" the rightmost column uses all the width it can "
	r1c2 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c2 layoutSpec proportionalWidth: 1.0. 
	r1c2 layoutSpec fixedHeight: 0. 	
	r1c2 color: (Color white). 
	r1 addMorph: r1c2. 
	"label-3, the old file name"
	lab3 _ LabelMorph new.
	lab3 contents: 'foo-bar-baz-the-file-name.txt'.
	lab3 layoutSpec offAxisEdgeWeight: #columnLeft.
	lab3 layoutSpec proportionalWidth: 1.0.
	r1c2 addMorph: lab3. 
	"entry text widget for the newfilename  "
	ent1 _ OneLineEditorMorph new.
	ent1 contents: 'foo-bar-baz-the-file-name.txt'.
	ent1 layoutSpec proportionalWidth: 1.0.
	"lab1 layoutSpec offAxisEdgeWeight: #columnLeft."
	r1c2 addMorph: ent1.
	"self addMorph: lay."
	^ r1
	! !

!RenameFileMorph methodsFor: 'GUI building' stamp: 'NM 11/17/2021 10:21:11'!
morphR2
	|but1|
       "lay layoutSpec proportionalWidth: 1.0."
	"label-1"
	but1 _ PluggableButtonMorph new. 
	but1 label: ' Rename '.
	". align the button to the right side "
	but1 layoutSpec offAxisEdgeWeight: #columnRight.
	but1 color: (Color lightGray) lighter. 
	"but1 layoutSpec fixedHeight: 0. "
	^ but1
	! !

!RenameFileMorph class methodsFor: 'as yet unclassified' stamp: 'NM 11/17/2021 10:14:03'!
open
	|window|
	window _ self new.
	window buildMorphicWindow openInWorld .
	^ window ! !

!RenameFileMorph3 methodsFor: 'GUI building' stamp: 'NM 11/15/2021 19:43:06'!
buildMorphicWindow
	|lay|
	self setLabel: 'RenameFileAdd'. 
	lay _ self layoutMorph .
	". the main layout is a colum of items "  
	lay beColumn.
	lay separation: 10@10.
	lay addMorph: self morphR1 .
	lay addMorph: self morphR2. 
	"not effective"
	"lay layoutSpec fixedHeight: 0. "
	^ self ! !

!RenameFileMorph3 methodsFor: 'GUI building' stamp: 'NM 11/15/2021 19:41:39'!
morphR1
	|r1 r1c1 r1c2 lab1 lab2 lab3 ent1|
	r1 _ LayoutMorph new.
	r1 beRow.
	". let this row enalrge in width, but shrink as much as possible in height "
       r1 layoutSpec proportionalWidth: 1.0.
	r1 layoutSpec fixedHeight: 0. 
	"------------ leftmost column -------------------------------  "
       r1c1 _ LayoutMorph new. 
	r1c1 beColumn.
	r1c1 separation: 10@10. 
	". force this column to be the minimum possible width "
	r1c1 layoutSpec fixedWidth: 0. 
	r1c1 layoutSpec fixedHeight: 0. 
	r1 addMorph: r1c1. 
	"label-1"
	lab1 _ LabelMorph new.
	lab1 contents: ' Old name: '.
	lab1 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c1 addMorph: lab1. 
	"label-2"
	lab2 _ LabelMorph new.
	lab2 contents: ' New name: '.
	lab2 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c1 addMorph: lab2. 
	" ----------------- rightmost colum ----------------------------- "
	r1c2 _ LayoutMorph new. 
	r1c2 beColumn . 
	r1c2 separation: 10@10. 
	" the rightmost column uses all the width it can "
	r1c2 layoutSpec offAxisEdgeWeight: #columnLeft.
	r1c2 layoutSpec proportionalWidth: 1.0. 
	r1c2 layoutSpec fixedHeight: 0. 	
	r1 addMorph: r1c2. 
	"label-3, the old file name"
	lab3 _ LabelMorph new.
	lab3 contents: 'foo-bar-baz-the-file-name.txt'.
	lab3 layoutSpec offAxisEdgeWeight: #columnLeft.
	lab3 layoutSpec proportionalWidth: 1.0.
	r1c2 addMorph: lab3. 
	"entry text widget for the newfilename  "
	ent1 _ OneLineEditorMorph new.
	ent1 contents: 'foo-bar-baz-the-file-name.txt'.
	ent1 layoutSpec proportionalWidth: 1.0.
	"lab1 layoutSpec offAxisEdgeWeight: #columnLeft."
	r1c2 addMorph: ent1.
	"self addMorph: lay."
	^ r1
	! !

!RenameFileMorph3 methodsFor: 'GUI building' stamp: 'NM 11/15/2021 19:33:37'!
morphR2
	|but1|
       "lay layoutSpec proportionalWidth: 1.0."
	"label-1"
	but1 _ PluggableButtonMorph new. 
	but1 label: ' Rename '.
	". align the button to the right side "
	but1 layoutSpec offAxisEdgeWeight: #columnRight.
	"but1 layoutSpec fixedHeight: 0. "
	^ but1
	! !

!RenameFileMorph3 class methodsFor: 'as yet unclassified' stamp: 'NM 11/15/2021 19:40:44'!
open
	|window|
	window _ self new.
	window buildMorphicWindow openInWorld .
	^ window ! !
