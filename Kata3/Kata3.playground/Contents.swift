//: # Question 1
//: ## Seconds
//: Determine the number of seconds in a year and store the number in a variable named ```secondsInAYear```.


let oneYear = 365 // 1 year = 365 days
let oneDay = 24 // 1 day = 24 hours
let oneHour = 60 // 1 hour = 60 min
let oneMin = 60 // 1 min = 60 sec

var secondsInAYear = oneYear * oneDay * oneHour * oneMin

//need to do leap year coding




//: # Question 2
//: ## Coin Toss
//: If you use ```arc4random()``` it will give you a random number. Generate a random number and use it to simulate a coin toss. Print "heads" or "tails".
import Foundation
var randomNumber = arc4random() //declares randomNumber and equals it to the swift's function of a random number generater.

print("Random Number: \(randomNumber)") // Tells me, the user to print the number that was generated in the "random number generator" in string interpolation form.

if randomNumber % 2 == 0
{
    print("Heads")
}
else
{
    print("Tails")
}
// if any random number is divisible by two and its remainder is equal to zero it will print out heads, if the remainder is an odd number then it will print out tails.

//: # Question 3
//: ## Testing
//: Test if ```number``` is divisible by 3, 5 and 7. For example 105 is divisible by 3,5 and 7, but 120 is divisible only by 3 and 5 and not by 7. If ```number``` is divisible by 3, 5, 7 print "number is divisible by 3, 5 and 7" otherwise print "number is not divisible by 3, 5 and 7".
var number = arc4random() % 1000

if number % 3 == 0 && number % 5 == 0 && number % 7 == 0
{
    print("Number is divisible by 3, 5, and 7!")
}
else
{
    print("Number is not divisible by 3,5 and 7!")
}

/*
var number = 105

if number % 3 == 0 && number % 5 == 0 && number % 7 == 0
{
print("Number is divisible by 3, 5, and 7!")
}
else
{
print("Number is not divisible by 3,5 and 7!")
}

var number = 104

if number % 3 == 0 && number % 5 == 0 && number % 7 == 0
{
    print("Number is divisible by 3, 5, and 7!")
}
else
{
    print("Number is not divisible by 3,5 and 7!")
}

*/


