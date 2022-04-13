module homework2
import StdEnv



/*
1- Given a list consisting of 4 real values (first two values are one of the vertices of a rectangle x and y coordinate,
third is the rectangle's width and the fourth is the rectangle' height (width and height can be negative too). For example,
in case of  x =1, y=5, width=6, height=-2,
the bottom left vertex coordinates will be 1 and 3.
Define topLeft, topRight , bottomRight, and bottomLeft functions returning
the corresponding vertex of the rectangle as a list consisting of  x , y represinting the point of the resulting function.
*/


/*
topLeft :: [Real] -> [Real]

topLeft [] = abort ("Please enter a Real number!")
topLeft [x, y, w, h]
|w < 0.0 && h < 0.0 = [x + w, y]
|w < 0.0 && h > 0.0 = [x + w, y + h]
|w > 0.0 && h > 0.0 = [x, y + h]
|w > 0.0 && h < 0.0 = [x, y]

topRight :: [Real] -> [Real]

topRight [] = abort ("Please enter a Real number!")
topRight [x, y, w, h]
|w < 0.0 && h < 0.0 = [x, y]
|w < 0.0 && h > 0.0 = [x, y + h]
|w > 0.0 && h > 0.0 = [x + w, y + h]
|w > 0.0 && h < 0.0 = [x + w, y]

bottomLeft:: [Real] -> [Real]

bottomLeft [] = abort ("Please enter a Real number!")
bottomLeft [x, y, w, h]
|w < 0.0 && h < 0.0 = [x + w, y + h]
|w < 0.0 && h > 0.0 = [x + w, y]
|w > 0.0 && h > 0.0 = [x, y]
|w > 0.0 && h < 0.0 = [x, y + h]

bottomRight:: [Real] -> [Real]

bottomRight [] = abort ("Please enter a Real number!")
bottomRight [x, y, w, h]
|w < 0.0 && h < 0.0 = [x, y + h]
|w < 0.0 && h > 0.0 = [x, y]
|w > 0.0 && h > 0.0 = [x + w, y] 
|w > 0.0 && h < 0.0 = [x + w, y + h]
*/

//Start = topLeft[3.0, 5.0, 1.0, -7.0] ++  topRight[3.0, 5.0, 1.0, -7.0] ++ bottomLeft [3.0, 5.0, 1.0, -7.0] ++ bottomRight[3.0, 5.0, 1.0, -7.0]
          //[3.0 ,5.0 , 4.0 , 5.0  , 3.0 , -2.0 ,  4.0 ,  -2.0]
//Start = topLeft[2.0,8.0,-4.0,-7.0] ++  topRight[2.0,8.0,-4.0,-7.0] ++ bottomLeft[2.0,8.0,-4.0,-7.0] ++ bottomRight[2.0,8.0,-4.0,-7.0]
         // [-2.0,8.0,2.0,8.0,-2.0,1.0,2.0,1.0]
//Start = topLeft[1.0,6.0,4.0,2.0] ++  topRight[1.0,6.0,4.0,2.0] ++ bottomLeft[1.0,6.0,4.0,2.0] ++ bottomRight[1.0,6.0,4.0,2.0]
		  // [1.0,8.0,5.0,8.0,1.0,6.0,5.0,6.0]
//Start = topLeft[] ++ topRight[] ++ bottomLeft[] ++ bottomRight[]
          // Please enter a Real number!		 	 





/*
2. Given a list of numbers, multiply every even number of the list by 2,
and every odd number of the list by 3
*/


/*
multiply :: [Int] -> [Int]
multiply  [] = [] 
multiply [x:xs] 
| x rem 2 == 0 = [x * 2] ++ multiply xs 
| x rem 2 == 1 = [x * 3] ++ multiply xs
=multiply xs
*/


//Start = multiply [14, 22, 45, 56] // [28, 44, 135, 112]
//Start = multiply [13, 27, 44] // [39, 81, 88]
//Start = multiply [] // []





/*
3. Given two lists of integers of the same length, 
check if the elements on the same positions in the two lists are of the same property: both even or both odd.
Return True for empty lists. */ 

/*
sameNum :: [Int] [Int] -> Bool
sameNum [] _ = True
sameNum [x:xs] [y:ys]
|length[x:xs] <> length[y:ys] = abort ("Given lists are not of the same length!")
|(isEven x && isEven y && sameNum xs ys) || (isOdd x && isOdd y && sameNum xs ys) = True
=False
*/

//Start = sameNum [2,4,6,2] [2,2,1,2]  // False
//Start = sameNum [1,2,3,4] [3,8,5,12] // True
//Start = sameNum [] [] // True







