//
//  MineSweeperGrid.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class MineSweeperGrid {
    var time1 = CFAbsoluteTimeGetCurrent()
    var time2 = CFAbsoluteTimeGetCurrent()
    
    public func start() {
        // NOTE: The following input values will be used for testing your solution.
        print(mineSweeper2([[0, 2], [2, 0]], 3, 3))
        print(mineSweeper([[0, 2], [2, 0]], 3, 3))
        print(time1 < time2)
        // [[0, 1, -1],
        //  [1, 2, 1],
        //  [-1, 1, 0]]
        
        print(mineSweeper2([[0, 0], [0, 1], [1, 2]], 3, 4))
        print(mineSweeper([[0, 0], [0, 1], [1, 2]], 3, 4))
        print(time1 < time2)

        // [[-1, -1, 2, 1],
        //  [2, 3, -1, 1],
        //  [0, 1, 1, 1]]
        
        print(mineSweeper2([[1, 1], [1, 2], [2, 2], [4, 3]], 5, 5))
        print(mineSweeper([[1, 1], [1, 2], [2, 2], [4, 3]], 5, 5))
        print(time1 < time2)

        // [[1, 2, 2, 1, 0],
        //  [1, -1, -1, 2, 0],
        //  [1, 3, -1, 2, 0],
        //  [0, 1, 2, 2, 1],
        //  [0, 0, 1, -1, 1]]
        
        print(mineSweeper2([[0,0],[0,1]], 3,4))//[[-1,-1, 1, x],
        print(mineSweeper([[0,0],[0,1]], 3,4))//[[-1,-1, 1, x],
        print(time1 < time2)

                                                             // [2, 2, 1, x]
    }                                                       //  [x, x, x, x]
    
    
    private func mineSweeper2(_ bombLocations: [[Int]], _ numRows: Int, _ numCols: Int) -> [[Int]] {
        //iterate through the bombs
        //for each bomb, add 1 to the surrounding areas
        let startTime = CFAbsoluteTimeGetCurrent()

        let row: [Int] = Array(repeating: 0, count: numCols)
        var grid = Array(repeating: row, count: numRows)
        
        for bomb in bombLocations {
            let bomb_i = bomb[0]
            let bomb_j = bomb[1]
            grid[bomb_i][bomb_j] = -1
            
            for i in bomb_i-1...bomb_i+1 {
                for j in bomb_j-1...bomb_j+1 {
                    if i >= 0 && i < numRows && j >= 0 && j < numCols {
                        let bombCount = grid[i][j]
                        if bombCount > -1 {
                            grid[i][j] = bombCount + 1
                        }
                    }
                }
            }
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        time2 = timeElapsed
        return grid
    }

    
    
    
    
    private func mineSweeper(_ bombLocations: [[Int]], _ numRows: Int, _ numCols: Int) -> [[Int]] {
        //make empty grid
        //add bombs
        //go through each non-bomb node to see how many adjacent nodes have bombs and store in location
        //return the grid
        let startTime = CFAbsoluteTimeGetCurrent()

        let row: [Int] = Array(repeating: 0, count: numCols)
        var grid = Array(repeating: row, count: numRows)
        
        for location in bombLocations {
            let i = location[0]
            let j = location[1]
            grid[i][j] = -1
        }
        
        for i in 0..<numRows {
            for j in 0..<numCols {
                let element = grid[i][j]
                if element != -1 {
                    grid[i][j] = neighbourBombCount(i,j,grid, rows: numRows, cols: numCols)
                }
            }
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        time1 = timeElapsed
        return grid
    }
    
    private func neighbourBombCount(_ i: Int, _ j: Int, _ grid: [[Int]], rows: Int, cols: Int) -> Int {
        var bombCount = 0
        let locationsToCheck = [[i-1, j-1], [i-1, j], [i-1, j+1],
                                [i, j-1], [i, j+1],
                                [i+1, j-1], [i+1, j], [i+1, j+1]]
        
        for location in locationsToCheck {
            let y = location[0]
            let x = location[1]
            if y >= 0 && y < rows,
                x >= 0 && x < cols {
                if grid[y][x] == -1 { bombCount += 1 }
            }
        }

        return bombCount
    }
    
}
