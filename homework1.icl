module homework1
import StdEnv


// Write GetLastPositive function which returns the last digit of the number if its positive and -1 if the number is negative.

/*
GetLastPositive::Int->Int

GetLastPositive a 

|a >= 0 = a rem 10
= -1

Start= GetLastPositive 423412 
*/



//Given two real numbers decide whether the sum of the two numbers after the decimal points of 
//the two numbers is Even or not assume there is only one number after the decimal point.



/*
IsEvenDecimal:: Real Real->Bool

IsEvenDecimal a b = (toInt((a + b) * 10.0) rem 10) rem 2 == 0 




Start= IsEvenDecimal 3.4 5.2
*/



// Write a function that will take a digit (Int) // and return the respective word for it (String). 


/*
DigitToString:: Int->String

DigitToString x



| isMember x [0,1..9] = hd(drop x ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"])
= "Not a digit"



Start= DigitToString 2
*/


















































