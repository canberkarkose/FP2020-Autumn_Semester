module hw8CanberkArkose
import StdEnv



:: Tree a = Node a (Tree a) (Tree a) | Leaf


// Trees for testing, please do not remove them. 
tree1 :: Tree Int
tree1 = (Node 4 (Node 10 (Node 6 Leaf Leaf)(Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))

tree2 :: Tree Int
tree2 = (Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf) ))

tree3 :: Tree Int
tree3 = (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ))

tree4 :: Tree Int
tree4 = (Node 7 (Node 11 tree1 tree2) (Node 5 tree3 tree2))

tree5 :: Tree Int
tree5 = Node 1 tree3 tree4



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
listToTree list = (Node (hd list) Leaf(listToTree (tl list)))

nrNodes:: (Tree Int) -> Int 
nrNodes Leaf = 0
nrNodes (Node x l r) = 1 + nrNodes l + nrNodes r 

isLeaf :: (Tree a) -> Bool
isLeaf Leaf = True
isLeaf _ = False

extractSubLists :: a (Tree a) -> [(Tree a)] | Eq a
extractSubLists n tree = [subtree\\subtree<-(subTreeList tree)|(getNode subtree)==n]

subTreeList :: (Tree a) -> [(Tree a)]
subTreeList Leaf = []
subTreeList tree = subTreeList(goLeft tree) ++ [tree] ++ subTreeList(goRight tree)

depth:: (Tree Int) -> Int
depth Leaf = 0 
depth (Node x l r) = 1 + max(depth l)(depth r)

atLevel :: (Tree Int) Int -> [Int]
atLevel Leaf _ = []
atLevel (Node x le ri) level
| level == 1 = [x]
| level > 1 = atLevel le(level-1) ++ atLevel ri(level-1)
= []
/*
insertTree:: a (Tree a) -> (Tree a) | Ord, Eq a
insertTree e Leaf = Node e Leaf Leaf
insertTree e node=: (Node x le ri)
	|e<x= Node x (insertTree e le) ri
	|e==x=node
	|e>x=Node x le (insertTree e ri)
	
listToTree:: [a]-> (Tree a) | Ord,Eq a
listToTree [] = Leaf
listToTree [x:xs] = insertTree x (listToTree xs)
*/

/*
1. Given the binary tree, find how many nodes are there such that they have exactly
3 grandchildren non-leaf nodes.
Ex.:  1
    /   \
    2    3
   / \  / \
  4 5   6 Leaf
1st node has exactly 3 grandchildrens, so it's a 'good' node.
*/

/*
rootInList :: (Tree Int) -> [Int]
rootInList Leaf = []
rootInList (Node x l r) = [x]

countTripleParents :: (Tree Int) -> Int
countTripleParents Leaf = 0
countTripleParents (Node x l r)
|grandChildren l r = 1 + countTripleParents l + countTripleParents r
= countTripleParents l + countTripleParents r     
where
	grandChildren Leaf _ = False
	grandChildren _ Leaf = False
	grandChildren (Node x le ri) (Node y l r) = (length (rootInList le ++ rootInList ri ++ rootInList l ++ rootInList r)) == 3   
*/


//Start = countTripleParents tree1 // 1
//Start = countTripleParents tree2 // 1
//Start = countTripleParents tree3 // 1
//Start = countTripleParents tree4 // 4
//Start = countTripleParents tree5 // 5




/*
2.Given binary search tree and Integer value, remove all the nodes from the tree which have this value
Resulting tree should maintain binary search tree property.
Note: Removing a node requires rearanging the tree and not placing Leaf instead
*/

/*
//First solution
removeInt :: Int (Tree Int) -> (Tree Int)
removeInt _ Leaf = Leaf
removeInt a tree = listToTree (remove a tree2)
where
	tree2= treeToList(tree)
	remove y list = filter (\x -> x<>y) list
*/

/*
//Second solution
removeInt :: Int (Tree Int) -> (Tree Int)
removeInt _ Leaf = Leaf
removeInt num (Node x l r) 
|x == num = removeInt num l
= Node x (removeInt num l) (removeInt num r)
*/


//Start = removeInt 6 (Node 4 (Node 3 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)))
// (Node 4 (Node 3 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 4 Leaf Leaf)) (Node 6 Leaf Leaf))
//Start = removeInt 1 (Node 1 (Node 1 (Node 1 (Node 1 (Node 1 (Node 1 Leaf Leaf) Leaf) Leaf) Leaf) Leaf) Leaf) // Leaf



// 3.
// Given a tree, traverse it in level order.
// starting at the root element, then all elements below (left to right), then all
// elements below those (left to right), etc.
// Example:
// 1
// / \
// 2 3
// / \ / \
// 4 5 6 7
// Should return [1,2,3,4,5,6,7]

/*

// I feel like there is a simpler way to do it with the help of these two functions;
// but I couldn't find it :D 

depth:: (Tree Int) -> Int
depth Leaf = 0 
depth (Node x l r) = 1 + max(depth l)(depth r)

atLevel :: (Tree Int) Int -> [Int]
atLevel Leaf _ = []
atLevel (Node x le ri) level
| level == 1 = [x]
| level > 1 = atLevel le(level-1) ++ atLevel ri(level-1)
= []
*/

/*
//SOLUTION
aux:: [(Tree Int)] -> [Int]
aux [] = []
aux list = aux3 list ++ aux (aux4 list)
where
	aux2 x= not (isLeaf x)
	aux3 x= [x\\ (Node x l r)<-(filter aux2 list)] 
	aux4 x= flatten [[l,r]\\(Node x l r)<- (filter aux2 list)]
	
traverse:: (Tree Int) -> [Int]
traverse Leaf = []
traverse tree = aux [tree]
*/


//Start = levels (Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))) 
        // [15,3,20,1,10,18,21,7,13,19,26,8,11,24,28]
//Start = traverse (Node 4 (Node 3 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))) 
           // [4,3,5,3,4,5,6,2,1]
                      
           
           
           
           
           
 