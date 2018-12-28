//
//  RotatingA2DArray.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 25/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class RotatingA2DArray {
    
    public func start() {
        // NOTE: The following input values will be used for testing your solution.
        let a1 = [
            [1, 2, 3], //0,0 -> 2,2 -> 0,2 -> 0,0
            [4, 5, 6],
            [7, 8, 9]]
        // rotate(a1, 3) should return:
        // [[7, 4, 1],
        //  [8, 5, 2],
        //  [9, 6, 3]]
        
        let a2 = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]]
        // rotate(a2, 4) should return:
        // [[13, 9, 5, 1],
        //  [14, 10, 6, 2],
        //  [15, 11, 7, 3],
        //  [16, 12, 8, 4]]
        
        print(rotate90Deg(a1))
        print(rotate90Deg(a2))

        
    }
    
    /*
 [
 [1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]]
 */
    private func rotate90Deg(_ arr: [[Int]]) -> [[Int]] {
        //swap columns and rows
        let n = arr.count - 1
        let row = Array(repeating: 0, count: arr.count)
        var newArr = Array(repeating: row, count: arr.count)
        for (old_rowIndex, row) in arr.enumerated() { //[1,2,3]
            //row 0 --> col n
            let j = n - old_rowIndex //j = 2 - 0 = 2
            for (old_colIndex, element) in row.enumerated() { //0 //1
                let i = old_colIndex //1
                newArr[i][j] = element
            }
        }
        
        return newArr
    }
    
    //TODO: Figure this out
//    private func rotate90DegInplace(_ arr: [[Int]]) -> [[Int]] {
//        //swap columns and rows
//        var arr = arr
//        let n = arr.count - 1
//        let row = Array(repeating: 0, count: arr.count)
//        var storedValue = arr[0][0]
//
//        for (old_rowIndex, row) in arr.enumerated() { //[1,2,3]
//            //row 0 --> col n
//            let j = n - old_rowIndex //j = 2 - 0 = 2
//            for (old_colIndex, element) in row.enumerated() { //0 //1
//                let i = old_colIndex //1
//                var temp = newArr[i][j]
//                newArr[i][j] = element
//            }
//        }
//
//        return newArr
//    }
}
