module extraHw2
import StdEnv 


:: Position = Electrician | Developer | Architect | Junior
:: Company = Ericsson | Microsoft | Nokia | Cloudera | None
:: Candidate = {name::String, position::Position, experience::Int, previous::Company}
 

MacMillan::Candidate
MacMillan = {name="MacMillan",position=Electrician, experience =10, previous=Ericsson}

Goodenough::Candidate
Goodenough = {name="Goodenough",position=Developer, experience =4, previous=Cloudera}

Frank::Candidate
Frank = {name="Frank",position=Developer, experience=10, previous=Microsoft}

Akira::Candidate
Akira = {name="Akira",position=Electrician, experience=30, previous=Nokia }

Feringa::Candidate
Feringa = {name="Feringa",position=Architect, experience=14, previous=Microsoft}

Modrich::Candidate
Modrich = {name="Modrich",position=Architect, experience=25, previous=Ericsson}

Osamu::Candidate
Osamu = {name="Osamu",position=Electrician, experience=7, previous=Nokia }

Ryoji::Candidate
Ryoji = {name="Ryoji",position=Junior, experience=1, previous=Ericsson}

John ::Candidate
John  = {name="John",position=Junior, experience=0, previous=None}

Rudolph ::Candidate
Rudolph  = {name="Rudolph ",position=Developer, experience=9, previous=Ericsson}


aux:: Candidate -> Real
aux x
	| x.position == Electrician = 1.2
	| x.position == Junior = 1.0
	| x.position == Developer = 2.0
	| x.position == Architect = 3.0


aux2:: Candidate -> Real
aux2 y
	| y.previous == None = 1.0
	| y.previous == Nokia = 1.2
	| y.previous == Cloudera = 1.3
	| y.previous == Microsoft = 1.5
	| y.previous == Ericsson = 1.2


instance == Position
where
	(==) Electrician Electrician = True
	(==) Junior Junior = True
	(==) Developer Developer = True
	(==) Architect Architect = True
	(==) _ _ = False

instance == Company
where
	(==) Ericsson Ericsson = True
	(==) Microsoft Microsoft = True
	(==) Nokia Nokia = True
	(==) Cloudera Cloudera = True
	(==) None None = True
	(==) _ _ = False


/* 1

 Create an instance for Candidate to sort them. (using built-in sort function, you need to create instance for < operator)
 
 Candidates supposed to be sorted by its experience weighted by previous company and position. (multiply)
 
 For positions : 	Junior weights 1
 					Developer weights 2
 					Electrician weights 1.2
 					Architect weights 3
 					
 For previous company:	None weights 1
 						Nokia weights 1.2
 						Ericsson weights 1.2
 						Cloudera weights 1.3
 						Microsoft weights 1.5
 						
 Point for Rudolph : 9 * 2 * 1.2 = 21.6
 
*/


/*
instance < Candidate
where
	(<) x y = (toReal(x.experience))*(aux x)*(aux2 x) < (toReal(y.experience))*(aux y)*(aux2 y)
*/


//Start = map (\x = x.name) (sort [MacMillan,Goodenough,Frank,Akira,Feringa,Modrich,Osamu,Ryoji,John,Rudolph]) //["John","Ryoji","Osamu","Goodenough","MacMillan","Rudolph ","Frank","Akira","Feringa","Modrich"]




/* 2
 
 Given a binary tree of Candidates. Write a function which rearranges the tree and makes a balanced Binary search tree (BST)
 
 based on their points. In BST values in left subtree should be less than the current node's value and
 
 values in right subtree should be greater. 
 
 		3
 	   / \ 			For instance this tree is a BST, but not balanced.
 	  2   Leaf		 
 	 / \			If [3,1,2] is given, the BST you should return is :
 	1   Leaf
 	
 		2
 	   / \
 	  1   3
 	 / \ / \
 	L  L L  L
 */


/*
:: BST a = BSTNode a (BST a) (BST a) | BSTLeaf

instance < Candidate
where
	(<) x y = (toReal(x.experience))*(aux x)*(aux2 x) < (toReal(y.experience))*(aux y)*(aux2 y)


makeBST:: [Candidate] -> (BST Candidate)
makeBST [] = BSTLeaf
makeBST list = (BSTNode midNode (makeBST leftList) (makeBST rightList))
where
	sortedList= sort (list)
	len= length (sortedList)
	midNode= sortedList!!(len/2)
	leftList= take (len/2) sortedList
	rightList= drop ((len/2)+1) sortedList
*/

//Start= makeBST [MacMillan,Goodenough,Frank,Akira,Feringa,Modrich,Osamu,Ryoji,John,Rudolph]
 
// (BSTNode (Candidate "Rudolph " Developer 9 Ericsson) (BSTNode (Candidate "Osamu" Electrician 7 Nokia) (BSTNode (Candidate "Ryoji" Junior 1 Ericsson) (BSTNode (Candidate "John" Junior 0 None) BSTLeaf BSTLeaf) BSTLeaf) 
//														(BSTNode (Candidate "MacMillan" Electrician 10 Ericsson) (BSTNode (Candidate "Goodenough" Developer 4 Cloudera) BSTLeaf BSTLeaf) BSTLeaf)) 
// (BSTNode (Candidate "Feringa" Architect 14 Microsoft) (BSTNode (Candidate "Akira" Electrician 30 Nokia) (BSTNode (Candidate "Frank" Developer 10 Microsoft) BSTLeaf BSTLeaf) BSTLeaf) 
//														(BSTNode (Candidate "Modrich" Architect 25 Ericsson) BSTLeaf BSTLeaf)))


/* 3

 Recrutiers are discussing to hire for a position from shortlisted candidates.
 
 Given array of candidates, write a function which returns the most suitable candidates
 
 for every position appeared in the array. The most suitable candidate is someone who has
 
 the greatest point (calculated same as ex. 1)

*/


/*
aux:: Candidate -> Real
aux x
	| x.position == Electrician = 1.2
	| x.position == Junior = 1.0
	| x.position == Developer = 2.0
	| x.position == Architect = 3.0


aux2:: Candidate -> Real
aux2 y
	| y.previous == None = 1.0
	| y.previous == Nokia = 1.2
	| y.previous == Cloudera = 1.3
	| y.previous == Microsoft = 1.5
	| y.previous == Ericsson = 1.2


instance == Position
where
	(==) Electrician Electrician = True
	(==) Junior Junior = True
	(==) Developer Developer = True
	(==) Architect Architect = True
	(==) _ _ = False

instance == Company
where
	(==) Ericsson Ericsson = True
	(==) Microsoft Microsoft = True
	(==) Nokia Nokia = True
	(==) Cloudera Cloudera = True
	(==) None None = True
	(==) _ _ = False

instance < Candidate
where
	(<) x y = (toReal(y.experience))*(aux y)*(aux2 y) < (toReal(x.experience))*(aux x)*(aux2 x)
	
instance == Candidate
where
	(==) x y = x.position == y.position

arrayToList::{Candidate} -> [Candidate]
arrayToList arr = [x\\x<-:arr]

wantedCandidates :: {Candidate} -> [(Position, String)]
wantedCandidates arr= map (\x = (x.position,x.name))  (removeDup(sort list))
where
	list= arrayToList(arr)
*/


//Start= wantedCandidates {MacMillan,Goodenough,Frank,Akira,Feringa,Modrich,Osamu,Ryoji,John,Rudolph} // [(Electrician,"Akira"),(Developer,"Frank"),(Architect,"Modrich"),(Junior,"Ryoji")]
//Start = wantedCandidates {MacMillan,Goodenough,Feringa,Osamu,John,Rudolph} // [(Electrician,"MacMillan"),(Developer,"Rudolph "),(Architect,"Feringa"),(Junior,"John")]
//Start = wantedCandidates {Feringa,Osamu,MacMillan} // [(Architect,"Feringa"),(Electrician,"MacMillan")]


