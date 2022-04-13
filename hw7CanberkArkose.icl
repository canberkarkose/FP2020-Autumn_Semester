module hw7CanberkArkose
import StdEnv



goLeft :: (Tree a) -> (Tree a)
goLeft (Node x l r) = l

goRight :: (Tree a) -> (Tree a)
goRight (Node x l r) = r

getNode :: (Tree a) -> a
getNode (Node x l r) = x

treeToList :: (Tree a) -> [a] | Ord a
treeToList Leaf = []
treeToList tree = [getNode tree]++treeToList(goLeft tree)++treeToList(goRight tree)

listToTree :: [a] -> (Tree a) | Ord, Eq a
listToTree [] = Leaf
listToTree list = (Node (hd list) Leaf (listToTree (tl list)))



/*
	Task 1: 
	
	Update a tree values with the given function.
	
   
	TASK: make even values 0 and odd values 1
	
		E.G:
	   TREE1
	    07
	   /   \
	 02	    20
	 /\	    / \
	01 04  10 30 
	
	   TREE2
	    05
	   /   \
	 01     03
	 /\     / \
   11  13  07  09
   
	so result for tree1:
	   1
	  / \
	 0	 0
 	/\	 /\
   1  0 0  0 
	   
*/


:: Tree a = Node a (Tree a) (Tree a) | Leaf
tree1 = Node 7
						( Node 2 (Node 1 Leaf Leaf) (Node 4 Leaf Leaf))
						( Node 20 (Node 10 Leaf Leaf) (Node 30 Leaf Leaf))
						
						
tree2 = Node 5
	 				   	( Node 3 (Node 13 Leaf Leaf) (Node 11 Leaf Leaf)) 
						( Node 1 (Node 7 Leaf Leaf) (Node 9 Leaf Leaf))
						
/*						
//First Solution
updateTree:: (Tree Int) -> (Tree Int)
updateTree tree = listToTree [(\x | isEven x = 0 = 1) a\\a<-list]
where
	list= treeToList(tree)

//Second Solution
updateTree :: (Tree Int) -> (Tree Int)
updateTree Leaf=Leaf
updateTree (Node x le ri) = Node ((\x | isEven x = 0 = 1) x) (updateTree le) (updateTree ri)
*/


//Start = updateTree tree1
			/* 			
						Node 1 
						( Node 0 (Node 1 Leaf Leaf) (Node 0 Leaf Leaf)) 
						( Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf Leaf)
			*/
			
			
//Start = updateTree tree2
			/* 			
						All are 1s
			*/
			
			
		
			

/*
	Given a key determine in which level it is stored in the Tree.
	
	   TREE1
	    07           <- Level 0
	   /   \
	 02	    20       <- Level 1
	 /\	    / \
	01 04  10 30     <- Level 2
	
		 
		 
*/

/*
path:: Int (Tree Int) Int -> Int
path _ Leaf _ = 0
path query (Node x left right) level
| not(isMember query(tree)) = level-1
| query == x = level
= (path query left level+1) + (path query right level+1)
where
	tree= treeToList(Node x left right)

getLevel:: Int (Tree Int) -> Int
getLevel b tree = path b tree 0
*/

//Start = getLevel 7 tree1 // 0
//Start = getLevel 10 tree1 // 2
//Start = getLevel 55 tree1 // -1
//Start = getLevel 13 tree2 // 2




/*
	Get all possible number that accept division to a given number in the given tree into a list.
	
	
	   TREE1
	    07
	   /   \
	 02	    20
	 /\	    / \
	01 04  10 30 
	
	   TREE2
	    05
	   /   \
	 01     03
	 /\     / \
   11  13  07  09
	
	answer: [7] // Since only 7 is divisble by 7.
*/

/*
getDivisors:: Int (Tree Int) -> [Int]
getDivisors a tree = [x\\x<-list | x rem a == 0]
where
	list = treeToList(tree)
*/


//Start = getDivisors 7 tree1 // [7]
//Start = getDivisors 3 tree2 // [3,9]
//Start = getDivisors 1 tree1 // [7,2,1,4,20,10,30]
//Start = getDivisors 10 tree1 // [20,10,30]



			
			
			
			
			
