//
//  ReverseVowelsInAString.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 23/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class ReverseVowelsInABook {
    private let vowelsTable: [Character: Bool] = ["a": true,
                                                  "e": true,
                                                  "i": true,
                                                  "o": true,
                                                  "u": true,
                                                  "y": true]
    
    public func start() {
        let input = Book().text //ibcdefgha
        let output = reverseVowels(input)
        print(output)
    }
    
    private func reverseVowels(_ inputString: String) -> String {
        var input = Array(inputString)
        var leftIndex = 0
        var rightIndex = input.count - 1
        
        var output = input
        
        while leftIndex < rightIndex {
            let left = input[leftIndex]
            let right = input[rightIndex]
            let leftIsVowel = isVowel(left)
            let rightIsVowel = isVowel(right)
            
            if leftIsVowel && rightIsVowel {
                
                output[leftIndex] = right
                output[rightIndex] = left
                leftIndex += 1
                rightIndex -= 1
                
            } else {
                
                if !leftIsVowel {
                    leftIndex += 1
                }
                
                if !rightIsVowel {
                    rightIndex -= 1
                }
            }
        }
        
        return String(output)
        
    }
    
    private func isVowel(_ char: Character) -> Bool {
        return vowelsTable[char] != nil
    }
    
}
