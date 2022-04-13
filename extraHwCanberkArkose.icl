module extraHwCanberkArkose
import StdEnv

/*
1. Given the list of tuples, where the first element is the list of numbers, the second
element is a bound (Int) and the third one is the switch (Bool). If the switch is true
remove all elements greater than bound from the list, if the switch is false remove all
elements less than bound.
Ex.
*/

/*
dualFilter :: [([Int],Int,Bool)] -> [[Int]]
dualFilter [] = []
dualFilter [(list,bound,switch):xs]
| switch == True = [(filter (\x -> x <= bound) list)] ++ dualFilter xs
= [(filter (\x -> x >= bound) list)] ++ dualFilter xs
*/

//Start = dualFilter [([1..10], 5, True), ([1..10], 5, False)] // [[1,2,3,4,5],[5,6,7,8,9,10]]
//Start = dualFilter [([3,5..20], 3, True), ([], 4, False), ([1..5], 5, True)] // [[3],[],[1,2,3,4,5]]
//Start = dualFilter [] // []
//Start = dualFilter [([1,3,8,2,12,45,5,1,3,5,81,12], 10, True)] // [[1,3,8,2,5,1,3,5]]

arrayToList:: {Int} -> [Int]
arrayToList arr = [x\\x<-:arr]


:: Library = {name :: String , books :: {Book} , numberOfBooks :: Int}
:: Book =  {
               id :: String ,
               numberOfChapters :: Int,
               impTopics :: {Int}    // contatining numbers indicating the number of important 
                                     // topics in each chapter of the book.
             }
/*
2-Given an array of Libraries return the library for
 which the  total sum of the  sum of  impTopics of all the books in the 
 library is the highest in the given array of libraries .

Example : 

b1 = {name = "b1" , numberOfChapters = 4 , impTopics = {3,4,5,6}}
b5 = {name = "b5" , numberOfChapters = 5 , impTopics = {20,50,10,10,10}}

lib1  = {name = "lib3" , books = {b1,b5} , numberOfBooks = 2} 
lib2  = {name = "lib5" , books = {b1} , numberOfBooks = 3} 

the sum of impTopics of the two books  in lib1 is  3 + 4 + 5 + 6 + 20 + 50 + 10 + 10 + 10 =  118  
the sum of impTopics in lib2 =  3 + 4 + 5 + 6 = 18 
 
hence libraryWithHighestSum {lib1 , lib2} is lib1 because the 
total sum of the  sum of impTopics of its books is the biggest in the given array.
*/


b1 :: Book
b1 = {id = "b1" , numberOfChapters = 4 , impTopics = {3,4,5,6}}
b2 :: Book
b2 = {id = "b2" , numberOfChapters = 6 , impTopics = {20,3,4,3,0,100}}
b3 :: Book
b3 = {id = "b3" , numberOfChapters = 1 , impTopics = {0}}
b4 :: Book
b4 = {id = "b4" , numberOfChapters = 8 , impTopics = {1,2,3,4,5,6,7,8}}
b5 :: Book
b5 = {id = "b5" , numberOfChapters = 5 , impTopics = {20,50,10,10,10}}

lib1 :: Library
lib1  = {name = "lib1" , books = {b1,b2,b3} , numberOfBooks = 3} 
lib2 :: Library
lib2  = {name = "lib2" , books = {b1,b2,b3,b4,b5} , numberOfBooks = 5} 
lib3 :: Library
lib3  = {name = "lib3" , books = {b1,b5} , numberOfBooks = 2} 
lib4 :: Library
lib4  = {name = "lib4" , books = {b5,b3,b2} , numberOfBooks = 3} 
lib5:: Library
lib5  = {name = "lib5" , books = {b1} , numberOfBooks = 3} 

/*
libraryWithHighestSum :: {Library} -> Library 
libraryWithHighestSum arr =fst(myFold (>) tplLib)
where 
	list=[(x,[y\\y<-:x.books])\\x<-:arr]
	tplLib=[(fst z,sum[sum[v\\v<-:q.impTopics]\\q<-(snd z)])\\z<-list]
	myFold operator [x:xs] = foldr (\a b | operator (snd a)(snd b) = a = b ) x xs 
*/

//Start = libraryWithHighestSum {lib1,lib3,lib5} // (Library "lib1" {(Book "b1" 4 {3,4,5,6}),(Book "b2" 6 {20,3,4,3,0,100}),(Book "b3" 1 {0})} 3) 
//Start = libraryWithHighestSum {lib2,lib3,lib4,lib5} // (Library "lib2" {(Book "b1" 4 {3,4,5,6}),(Book "b2" 6 {20,3,4,3,0,100}),(Book "b3" 1 {0}),(Book "b4" 8 {1,2,3,4,5,6,7,8}),(Book "b5" 5 {20,50,10,10,10})} 5)
//Start = libraryWithHighestSum {lib1,lib3,lib4} // (Library "lib4" {(Book "b5" 5 {20,50,10,10,10}),(Book "b3" 1 {0}),(Book "b2" 6 {20,3,4,3,0,100})} 3)
//Start = libraryWithHighestSum {lib5} // (Library "lib5" {(Book "b1" 4 {3,4,5,6})} 3) 
//Start = libraryWithHighestSum {} // "No library"  




/*
3- Write binary tree ADT. It should have two types: Node with value and left and right subtrees and Leaf.
Write treeToFilteredList function which takes two arguments condition function and tree. Function should
return list of values from tree which satisfy given condition.
*/

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
// TODO
:: Tree a = Node a (Tree a) (Tree a) | Leaf

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

/*
treeToFilteredList:: (a -> Bool) (Tree a) -> [a] | Ord a
treeToFilteredList cond Leaf = []
treeToFilteredList cond tree= filter cond list
where
	list= treeToList(tree)
*/
	


//Start = treeToFilteredList (\x = (x rem 2) == 0) tree1 // [4,10,6,20,12]
//Start = treeToFilteredList (\x = x rem 2 == 1 && x > 10) tree2 // [31,17,31,11]
//Start = treeToFilteredList (\x = x > 9 && x < 30) tree3 // [12,11,11,17]
//Start = treeToFilteredList (\x = x rem 3 == 2) tree4 // [11,11,20,5,17,14,11,5,11,11,32,17,5,5,17,14,11]
//Start = treeToFilteredList (\x = (x rem 2) == 0) tree5 // [12,32,4,4,4,10,6,20,12,10,14,12,12,32,4,4,10,14,12]