//
//  isRotation.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class Rotation {
    
    public func start() {
//        # NOTE: The following input values will be used for testing your solution.
        let list1 = [1, 2, 3, 4, 5, 6, 7]
        let list2a = [4, 5, 6, 7, 8, 1, 2, 3]
//        # is_rotation(list1, list2a) should return False.
        let list2b = [4, 5, 6, 7, 1, 2, 3]
//        # is_rotation(list1, list2b) should return True.
        let list2c = [4, 5, 6, 9, 1, 2, 3]
//        # is_rotation(list1, list2c) should return False.
        let list2d = [4, 6, 5, 7, 1, 2, 3]
//        # is_rotation(list1, list2d) should return False.
        let list2e = [4, 5, 6, 7, 0, 2, 3]
//        # is_rotation(list1, list2e) should return False.
        let list2f = [1, 2, 3, 4, 5, 6, 7]
//        # is_rotation(list1, list2f) should return True.
        
        
        let ret1 = isRotation(list1, list2a)
        let ret2 = isRotation(list1, list2b)
        let ret3 = isRotation(list1, list2c)
        let ret4 = isRotation(list1, list2d)
        let ret5 = isRotation(list1, list2e)
        let ret6 = isRotation(list1, list2f)

        print(ret1)
        print(ret2)
        print(ret3)
        print(ret4)
        print(ret5)
        print(ret6)

    }
    
    private func isRotation(_ arr1: [Int], _ arr2: [Int]) -> Bool {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        guard arr1.count == arr2.count else { return false }
        
        var index1 = 0
        guard var index2 = arr2.firstIndex(of: arr1[index1]) else { return false }
        let startIndex2 = index2
        
        while index1 < arr1.count {
            let element1 = arr1[index1]
            let element2 = arr2[index2]
            if element1 != element2 { return false }

            index1 += 1
            index2 = (startIndex2 + index1) % arr1.count
        }
        
       
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time1: \(timeElapsed)")
        
        return true
    }
}
