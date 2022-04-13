module hw10CanberkArkose
import StdEnv


:: University = ELTE | BME | Corvinus
:: Student = {name::String, uni :: University, grades:: [Int]}
 

Rose::Student
Rose = {name="Rose",uni=ELTE, grades =[5,5,3,4,2,4,5,5]}
Peter::Student
Peter = {name="Peter",uni=BME, grades =[3,2,3,4,2,4,2,1,4,3,2,4]}
Noah::Student
Noah = {name="Noah",uni=Corvinus,grades=[1,2,2,3,1,3,4,2,3,4,2,4,2,1]}
James::Student
James = {name="James",uni=ELTE,grades=[5,5,5,5,3,4,5,4,5]}
Lily::Student
Lily = {name="Lily",uni=BME,grades=[1,2,1,3,1,5,3,3,4,1,3,1,5,1,1]}
Harry::Student
Harry = {name="Harry",uni=Corvinus,grades=[3,4,1,3,4,2,3,5,5]}
Eros::Student
Eros = {name="Eros",uni=Corvinus,grades=[4,2,4,4,4,4,4,5,2]}
Isabella::Student
Isabella = {name="Isabella",uni=BME,grades=[5,5,5,4,5,5,4,5,4,5]}
Oliver::Student
Oliver = {name="Oliver",uni=ELTE,grades=[2,3,3,4,3,2,1,3,2,3]}
 

/* 1.
Given array of students, find the University which has highest
average of student average GPA.
 

Example:
{Peter, Eros, Harry}
Peter's average GPA - 2.83
Eros's average GPA - 3.67
Harry's average GPA - 3.33
 

Hence:
ELTE's average grades - []
BME's average grades - [2.83]
Corvinus's average grades - [3.67, 3.33]
 

Corvinus has highes average - 3.5
*/
/*
instance == University
where
	(==) ELTE ELTE = True
	(==) BME BME = True
	(==) Corvinus Corvinus = True
	(==) _ _ = False


mySum :: [Real] -> Real
mySum [] = 0.0
mySum [x:xs] = x + mySum xs

aux:: {Student} -> [(University,Real)]
aux arr = [(x.uni,(toReal(sum(x.grades))/toReal(length(x.grades))))\\x<-:arr]

aux2:: {Student} -> [University]
aux2 arr = removeDup[x.uni\\x<-:arr]

aux3:: [University] [(University,Real)] -> [(University,Real)]
aux3 [] _ = []
aux3 [x:xs] tpl = [(x,(mySum[snd y\\y<-tpl | fst y == x])/toReal(length([snd y\\y<-tpl | fst y == x])))] ++ aux3 xs tpl

uniWithHighestAverage :: {Student} -> University
uniWithHighestAverage stud = fst (myFold (>) (aux3 (aux2 stud) (aux stud)))
where
	myFold operator [x:xs] = foldr (\a b | operator (snd a)(snd b) = a = b ) x xs 
*/

//Start = uniWithHighestAverage {Rose,Harry,Isabella,Oliver,James,Noah,Lily,Peter,Eros} // ELTE
//Start = uniWithHighestAverage {Rose,Harry,Isabella} // BME
//Start = uniWithHighestAverage {Oliver, Noah,James,Lily} // ELTE
//Start = uniWithHighestAverage {Peter, Eros, Harry} // Corvinus



/*
2- Implement a function that interleaves three arrays. So for input arrays {1,2,3}, {4,5,6}
and {7,8,9} the function must return the array {1,4,7,2,5,8,3,6,9}. If an array is out of elements
we continue interleaving the remaining arrays.
Example: {1,2} {3,4,5,6} {7,8,9} -> {1,3,7,2,4,8,5,9,6}
*/

/*
arrayToList::{a}->[a]
arrayToList arr = [a \\ a <-: arr] 

listToArray:: [a]->{a}
listToArray list = {a\\a<-list}

aux :: [Int] [Int] [Int] -> [Int]
aux [] [] [] = []
aux [] [b:bs] [c:cs] = [] ++ [b] ++ [c] ++ aux [] bs cs
aux [a:as] [] [c:cs] = [a] ++ [] ++ [c] ++ aux as [] cs
aux [a:as] [b:bs] [] = [a] ++ [b] ++ [] ++ aux as bs []
aux [] [b:bs] [] = [] ++ [b] ++ [] ++ aux [] bs []
aux [a:as] [] [] = [a] ++ [] ++ [] ++ aux as [] []
aux [] [] [c:cs] = [] ++ [] ++ [c] ++ aux [] [] cs
aux [a:as][b:bs][c:cs] = [a] ++ [b] ++ [c] ++ aux as bs cs

interleave :: {Int} {Int} {Int} -> {Int}
interleave arr1 arr2 arr3 = listToArray(aux list1 list2 list3)
where
	list1=arrayToList(arr1)
	list2=arrayToList(arr2)
	list3=arrayToList(arr3)

*/
//Start = interleave {1,2,3} {4,5,6} {7,8,9} // {1,4,7,2,5,8,3,6,9}
//Start = interleave {1,2} {3,4,5,6} {7,8,9} // {1,3,7,2,4,8,5,9,6}
//Start = interleave {} {1,2,3} {4} // {1,4,2,3}
//Start = interleave {} {} {} // {}
//Start = interleave {1,2} {3,4,5} {6,7,8,9,10,11,12} // {1,3,6,2,4,7,5,8,9,10,11,12}



/*
3- Given a predefined MaybeInt type, define a new operator !+!
for accessing the nth element in the list, you can test it with showFifthElement function.
*/

/*
:: MaybeInt = Just Int | Nothing

(!+!) :: [Int] Int -> MaybeInt 
(!+!) list num
|num == 0 || not(list==[]) = Nothing
= Just (list!!num)


showFifthElement :: [Int] -> String
showFifthElement xs
= case xs !+! 4 of
	Nothing -> "There is no fifth element in this list"
	Just n -> "The fifth element of the list is: " +++ toString(n)
*/
//Start = showFifthElement [1,2..10] // "The fifth element of the list is: 5"
//Start = showFifthElement [0,0] // "There is no fifth element in this list"
//Start = showFifthElement [33, 41, 56, 12, 96, 1] // "The fifth element of the list is: 96"



