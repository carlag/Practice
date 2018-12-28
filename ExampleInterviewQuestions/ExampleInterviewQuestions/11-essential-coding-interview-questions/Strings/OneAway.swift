//
//  OneAway.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class OneAway {
    
    public func start() {
        print(one_away("abcde", "abcd"))  //# should return True
        print(one_away("abde", "abcde"))  //# should return True
        print(one_away("a", "a")) // # should return True
        print(one_away("abcdef", "abqdef")) // # should return True
        //a:1, b:1, c:1, d:1, e:1, f:1
        //a:1, b:1, c:?, d:1, e:1, f:1, q:1
        print(one_away("abcdef", "abccef")) // # should return True
        print(one_away("abcdef", "abcde"))  //# should return True
        print(one_away("aaa", "abc"))  //# should return False
        print(one_away("abcde", "abc")) // # should return False
        print(one_away("abc", "abcde")) // # should return False
        print(one_away("abc", "bcc")) // # should return False
        //a:1, b:1, c:1
        //a:?, b:1, c:2
        //a, c
        
    }
    
    private func one_away(_ str1: String, _ str2: String) -> Bool {
        let startTime = CFAbsoluteTimeGetCurrent()
        var timeElapsed = CFAbsoluteTimeGetCurrent()
    
        if str1 == str2 { return true }
    
        var charCount1 = [Character: Int]()
        var charCount2 = [Character: Int]()

        for char in str1 {
            let count = charCount1[char] ?? 0
            charCount1[char] = count + 1
        }
        
        for char in str2 {
            let count = charCount2[char] ?? 0
            charCount2[char] = count + 1
        }
        
        let chars = Set(str1+str2)
        
        var differenceCount = 0
        for char in chars {
            if charCount1[char] != charCount2[char] {
                differenceCount += 1
            }
        }

        timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
//        print("Time1: \(timeElapsed)")
        
        return differenceCount == 1
    }
}
