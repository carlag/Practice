//
//  MineSweeperGridExpander.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 24/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class MineSweeperGridExpander {
    public func start() {
        
        // NOTE: The following input values will be used for testing your solution.
        let field1 = [
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 1, -1, 1, 0]]
        
        print(click(field1, 3, 5, 2, 2))
        // [[0, 0, 0, 0, 0],
        //  [0, 1, 1, 1, 0],
        //  [0, 1, -1, 1, 0]]
        
        print(click(field1, 3, 5, 1, 4))
        // [[-2, -2, -2, -2, -2],
        //  [-2, 1, 1, 1, -2],
        //  [-2, 1, -1, 1, -2]]
        
        
        let field2 = [
            [-1, 1, 0, 0],
            [1, 1, 0, 0],
            [0, 0, 1, 1],
            [0, 0, 1, -1]]
        
        print(click(field2, 4, 4, 0, 1))
        // [[-1, 1, 0, 0],
        //  [1, 1, 0, 0],
        //  [0, 0, 1, 1],
        //  [0, 0, 1, -1]]
        
        print(click(field2, 4, 4, 1, 3))
        // [[-1, 1, -2, -2],
        //  [1, 1, -2, -2],
        //  [-2, -2, 1, 1],
        //  [-2, -2, 1, -1]]
    }
    
    private func click(_ field: [[Int]], _ numRows: Int, _ numCols: Int, _ clicked_i: Int, _ clicked_j: Int) -> [[Int]] {
        var field = field
        
        if field[clicked_i][clicked_j] != 0 {
            return field
        }
        
        var queue = [[clicked_i, clicked_j]]
        while !queue.isEmpty {
            guard let position = queue.last else { return field }
            queue.removeLast()
            let i = position[0]
            let j = position[1]
            if field[i][j] == 0 {
                let children = getChildren(field, numRows, numCols, i, j)
                queue.append(contentsOf: children)
                field[i][j] = -2
            }
        }
        
        return field
    }
    
    private func getChildren(_ field: [[Int]], _ numRows: Int, _ numCols: Int, _ old_i: Int, _ old_j: Int) -> [[Int]] {
        var children = [[Int]]()
        for i in old_i-1...old_i+1 {
            for j in old_j-1...old_j+1 {
                if i >= 0, j >= 0, i < numRows, j < numCols, !(i == old_i && j == old_j) {
                    if field[i][j] == 0 {
                        children.append([i,j])
                    }
                }
            }
        }
        return children
    }
    
    private func click2(_ field: [[Int]], _ numRows: Int, _ numCols: Int, _ clicked_i: Int, _ clicked_j: Int) -> [[Int]] {
        var field = field
        if field[clicked_i][clicked_j] != 0 {
            return field
        } else {
          field[clicked_i][clicked_j] = -2
        }
        
        for i in clicked_i-1...clicked_i+1 {
            for j in clicked_j-1...clicked_j+1 {
                if i >= 0, j >= 0, i < numRows, j < numCols {
                    let check = field[i][j]
                    if check == 0 {
                       field = click(field, numRows, numCols, i, j)
                    }
                }
            }
        }
        return field
    }
}
