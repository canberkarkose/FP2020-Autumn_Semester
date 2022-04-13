module hw5CanberkArkose
import StdEnv


/*1. Given the list of points and a distance. Each point is represented with tuple, containing X and Y coordinates
in 2D plane. Return how many pairs of points are there so that, distance between them is equal to the given number.
*/
// You can use this formula to find the distance between two points d = square root of ((x_2-x_1)²+(y_2-y_1)²) 

/*
distance::(Int,Int)(Int,Int)->Real
distance (x1,y1)(x2,y2) = sqrt(toReal(a+b))
where
	a = (x2-x1)^2
	b = (y2-y1)^2
	

aux::[(Int,Int)] Int -> [Real]
aux [] _ = []
aux [x:xs] b = filter (\x=x==toReal(b))(map (distance x) xs ++ aux xs b)

pointDistance :: [(Int,Int)] Int -> Int
pointDistance list n = length(map (\x=toInt x) (aux list n))
*/

//Start = pointDistance [(1,1), (4,5), (8,8), (10,3)] 5 // 2
//Start = pointDistance [(1,1), (4,5), (8,8), (10,3)] 2 // 0
//Start = pointDistance [(3,4), (3,8), (7,8)] 4 // 2
//Start = pointDistance [] 3 // 0
//Start = pointDistance [(1,1)] 2 // 0



/*2. Write a function that takes a list of integers and gives back a tuple that contains:
(the integer in the list, a boolean value)
the boolean value tells if when cutting the integer in half it consists of
the same number, e,g, 2020 -> 20 20 so it's true but 2008 -> 20 08 it's not.
*/

/*
getDigits :: Int -> [Int]
getDigits x 
| x < 10 = [x]
=  [x rem 10] ++ (getDigits (x/10))


aux:: Int -> (Int,Bool)
aux a 
| length(getDigits a) == 1 = (a,False)
| take (length(getDigits a)/2) (getDigits a) == drop (length(getDigits a)/2) (getDigits a) = (a, True)
=(a,False)


toTuple :: [Int] -> [(Int, Bool)]
toTuple [] = []
toTuple list = map aux list
*/



//Start = toTuple [] // []
//Start = toTuple [100, 2020, 1919] // [(100,False),(2020,True),(1919,True)]
//Start = toTuple [312, 1001, 1010] // [(312,False),(1001,False),(1010,True)]


/*

3-Given two integer numbers a and b , filter out the perfect numbers in the interval [a..b] and 
generate a list of tuples such that every tuple contains the perfect number and the number of 
its digits . 
In number theory, a perfect number is a positive integer that is equal to the sum of its positive divisors , 
excluding the number itself. For instance, 6 has divisors 1, 2 and 3, and 1 + 2 + 3 = 6, so 6 is a perfect number . 


e.g perfect 5 30 = [(6,1) , (28,2)] because 6 is in the interval [5..30] and it is 
perfect number and the number of its digits is 1, similarly for 28.  

*/ 

/*
divisors :: Int -> [Int]
divisors n = [x \\ x <- [1..(n-1)] | n rem x == 0]


getDigits :: Int -> [Int]
getDigits x 
| x < 10 = [x]
= [x rem 10] ++ (getDigits (x/10)) 


perfect:: Int Int -> [(Int,Int)]
perfect a b = [(x,length(getDigits x)) \\ x<-[a..b] | sum(divisors x) == x ]
*/


//Start = perfect 5 30 //  [(6,1),(28,2)]
//Start = perfect 20 1000// [(28,2),(496,3)]
//Start = perfect 300 9000 // [(496,3),(8128,4)]
//Start = perfect 100 200 // []








