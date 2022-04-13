module hw6CanberkArkose
import StdEnv



/*1. Given the list of integers, modify it in a following way:
I. Remove all numbers which are multiple of 3
II. Sort remaining list in descending order
III. Swap 1st and 2nd elements, 3rd and 4th, 5th and 6th and so on.
*/

/*
aux:: [a] -> [a] | Ord a   
aux [] = []
aux [y:ys] = aux[x\\x<-ys | x > y ] ++ [y] ++ aux [x\\x<-ys | x<=y]

aux2:: Int -> Bool
aux2 x
| x rem 3 <> 0 = True
=False

aux3:: [Int] -> [Int]
aux3 [] = []
aux3 [x] = [x]
aux3 [x,y:xs] = [y] ++ [x] ++ aux3 xs 

shuffleSort :: [Int] -> [Int]
shuffleSort list =  aux3(aux(filter (aux2) list))
*/

//Start = shuffleSort [4,3,2] // [2,4]
//Start = shuffleSort [4,1,3,2,5,6,7] // [5,7,2,4,1]
//Start = shuffleSort [3,6,3,9,12] // []
//Start = shuffleSort [2,4,5,7,14,17] // [14,17,5,7,2,4]
//Start = shuffleSort [] // []
 

// 2. Calculate Euler's totient function phi(m).
// Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime with m.
// Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.
// Two integers a and b are coprime, if the only positive integer that divides (is a divisor of) both of them is 1.

/*
isCoprime :: Int Int -> Bool
isCoprime a b
| gcd a b == 1 = True
=False

phi :: Int -> Int
phi n = length [x \\ x <- [1..n] | isCoprime x n] 
*/

//Start = phi 1 // 1
//Start = phi 10 // 4
//Start = phi 12414 // 4136
//Start = phi 100 // 40
//Start = phi 1000000 // 400000
 

// 3.
// Write function that takes String as input and removes vowels from it
 
/*
isVowel :: Char -> Bool
isVowel vowel
| (vowel == 'a') || (vowel == 'e') || (vowel == 'i') || (vowel == 'o') || (vowel == 'u') = True
| (vowel == 'A') || (vowel == 'E') || (vowel == 'I') || (vowel == 'O') || (vowel == 'U') = True
=False
 

removeVowels :: String -> String
removeVowels "" = ""
removeVowels str = toString[x \\ x<-:str | not(isVowel x)]
*/

 
//Start =  removeVowels "Xola" // "Xl"
//Start = removeVowels "Functional Programming" // "Fnctnl Prgrmmng"
//Start = removeVowels "Clean is the best" // "Cln s th bst"
//Start = removeVowels "Not really" // "Nt rll"
//Start = removeVowels "" // ""
//Start = removeVowels "N vwls hr" // "N vwls hr"










