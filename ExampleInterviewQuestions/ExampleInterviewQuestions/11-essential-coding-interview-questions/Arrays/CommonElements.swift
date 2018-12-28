//
//  CommonElements.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class CommonElements {
    var time1 = CFAbsoluteTimeGetCurrent()
    var time2 = CFAbsoluteTimeGetCurrent()
    
    public func start() {
        let list_a1 = [1, 3, 4, 6, 7, 9]
        let list_a2 = [1, 2, 4, 5, 9, 10]
//        # common_elements(list_a1, list_a2) should return [1, 4, 9] (a list).
        
        let list_b1 = [1, 2, 9, 10, 11, 12]
        let list_b2 = [0, 1, 2, 3, 4, 5, 8, 9, 10, 12, 14, 15]
//        # common_elements(list_b1, list_b2) should return [1, 2, 9, 10, 12] (a list).
        
        let list_c1 = [0, 1, 2, 3, 4, 5]
        let list_c2 = [6, 7, 8, 9, 10, 11]
//        # common_elements(list_b1, list_b2) should return [] (an empty list).
        
        let commonElements_a1 = findCommonElements(list_a1, list_a2)
        _ = findCommonElements2(list_a1, list_a2)
        print(commonElements_a1)
        print(time1 < time2)
        
        let commonElements_b1 = findCommonElements(list_b1, list_b2)
        _ = findCommonElements2(list_b1, list_b2)
        print(commonElements_b1)
        print(time1 < time2)

        let commonElements_c1 = findCommonElements(list_c1, list_c2)
        _ = findCommonElements2(list_c1, list_c2)
        print(commonElements_c1)
        print(time1 < time2)

    }
    
    private func findCommonElements(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let startTime = CFAbsoluteTimeGetCurrent()
        //hashtable [element: count]
        //set1, set2, difference
        //set1 subtract difference
        
        let set1 = Set(arr1) //O(n)
        let set2 = Set(arr2) //O(m)
        let diff = set1.subtracting(set2) //1,3,4 //O(n)
        let ret =  Array(set1.subtracting(diff)) //O(n)
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time1: \(timeElapsed)")
        time1 = timeElapsed
        
        return ret
    }
    
    //FASTER
    private func findCommonElements2(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let startTime = CFAbsoluteTimeGetCurrent()
        var common = [Int]()
        var index1 = 0
        var index2 = 0
        
        while index1 < arr1.count && index2 < arr2.count {
            let element1 = arr1[index1]
            let element2 = arr2[index2]
            
            if element1 == element2 {
                common.append(element1)
                index1 += 1
                index2 += 1
            } else if element1 < element2 {
                index1 += 1
            } else if element2 < element1 {
                index2 += 1
            } else {
                fatalError("Error. Could not compare elements")
            }
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time2: \(timeElapsed)")
        time2 = timeElapsed
        
        return common
    }
    
}
