//: Playground - noun: a place where people can play

import UIKit

//shortPlank -> length1
//longPlank -> length2
//numberOfShortPlanks -> count1
//numberOfLongPlanks -> count2

func getAllLengths(shortLength: Int, longLength: Int, numberOfShort: Int, numberOfLong: Int) -> Set<Int> {
    var possibleLengths: [Int] = [shortLength, longLength]
    
    for index1 in 1...numberOfShort {
        for index2 in 1...numberOfLong {
            possibleLengths.append((index1 * shortLength) + (index2 * longLength))
        }
    }
    return Set(possibleLengths)
}

print(getAllLengths(shortLength: 10, longLength: 5, numberOfShort: 2, numberOfLong: 2))


func calculateLength(length1: Int, length2: Int) {
    var plankCountShort = 2
    var plankCountLong = 2
    let longLength = 10
    let shortLength = 5
    
    var possibleLengths: [Int] = [longLength, shortLength]
    
    while plankCountLong >= 0 && plankCountShort >= 0 {
        possibleLengths.append(calculateLength())
    }
}
