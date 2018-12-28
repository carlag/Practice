//
//  NonRepeating.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class NonRepeating {
    
    public func start() {
        let ret2 = non_repeating("abcab") //# should return 'c'
        let ret3 = non_repeating("abab") //# should return None
        let ret4 = non_repeating("aabbbc") //# should return 'c'
        let ret5 = non_repeating("aabbdbc") //# should return 'd'
//        print(ret1 ?? "null")
        print(ret2 ?? "null")
        print(ret3 ?? "null")
        print(ret4 ?? "null")
        print(ret5 ?? "null")
//        print(ret6)
        
    }
    
    private func non_repeating(_ str: String) -> Character? {
        let arr1 = Array(str)
        let startTime = CFAbsoluteTimeGetCurrent()
        var timeElapsed = CFAbsoluteTimeGetCurrent()
        var charCount = [Character: Int]()

        for char in arr1 {
            if let count = charCount[char] {
                charCount[char] = count + 1
            } else {
                charCount[char] = 1
            }
        }
        
        for char in arr1 {
            if let count = charCount[char],
                count == 1 {
                timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                print("Time1: \(timeElapsed)")
                return char
            }
        }
        
        timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time1: \(timeElapsed)")
        
        return nil
    }
}
