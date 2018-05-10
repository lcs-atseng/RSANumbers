//
//  main.swift
//  RSANumbers
//
//  Created by Gordon, Russell on 2018-04-04.
//  Copyright © 2018 Gordon, Russell. All rights reserved.
//

import Foundation

// INPUT
// Collect and filter user input here
// get lower limit
var lowerLimit = 0
while true {
    print("Enter lower limit of range.")
    //test 1
    guard let givenInput = readLine() else {
        continue
    }
    //test 2
    guard let givenInteger = Int(givenInput) else {
        continue
    }
    //test 3
    if givenInteger < 1 {
        continue
    }
    lowerLimit = givenInteger
    break
}

// get higher limit
var upperLimit = 0
while true {
    print("Enter higher limit of range.")
    guard let givenInput = readLine() else {
        continue
    }
    guard let givenInteger = Int(givenInput) else {
        continue
    }
    if givenInteger > 1000 {
        continue
    }
    upperLimit = givenInteger
    break
}
// PROCESS
// Implement the primary logic of the problem here
func countOfDivisors(for number: Int) -> Int {
    
    // Track number of divisors
    if number == 1 {
        return 1
    } else if number == 2 || number == 3 {
        return 2
    } else {
        // Every number 4 or greater has at least two divisors
        var divisorCount = 2
        // Check possible divisors from 2 to number/2
        // (Any given number has no divisors greater than number/2
        //  other than the number itself).
        // e.g.: 8 has no divisors greater than 4 other than 8
        for possibleDivisor in 2...number / 2 {
            
            if number % possibleDivisor == 0 {
                divisorCount += 1
            }
            
        }
        
        // Return the number of divisors
        return divisorCount
        
    }
    
    
}

// Keep track of count of RSA numbers founds
var countOfRSANumbers = 0

// Check each number inside the range of the lower and upper limit
for aNumber in lowerLimit...upperLimit {
    
    // Get count of divisors and when count is 4, we have an RSA number
    if countOfDivisors(for: aNumber) == 4 {
        countOfRSANumbers += 1
    }
}

// OUTPUT
print("The number of RSA numbers between \(lowerLimit) and \(upperLimit) is \(countOfRSANumbers)")
