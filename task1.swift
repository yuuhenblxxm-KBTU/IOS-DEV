import Foundation

// Print numbers 1..100, replace multiples of 3 with "Fizz", multiples of 5 with "Buzz", both with "FizzBuzz"
for i in 1...100 {
    if i % 15 == 0 { // divisible by both 3 and 5
        print("FizzBuzz")
    } else if i % 3 == 0 { // divisible by 3
        print("Fizz")
    } else if i % 5 == 0 { // divisible by 5
        print("Buzz")
    } else {
        print(i)
    }
}