//
//  LowestCommonAncestor.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 26/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation
class LowestCommonAncestor {
    class Node {
        var value: Int
        var left: Node?
        var right: Node?
        
        init(_ value: Int, _ left: Node? = nil, _ right: Node? = nil) {
            self.value = value
            self.left = left
            self.right = right
        }
    }
    
    private func create_tree(_ mapping: [(Int, [Int])], _ head_value: Int) -> Node {
        let head = Node(head_value)
        var nodes = [head_value: head]
        
        for item in mapping {
            let value = item.1
            nodes[value[0]] = Node(value[0])
            nodes[value[1]] = Node(value[1])
        }
        
        for item in mapping {
            let key = item.0
            let value = item.1
            nodes[key]?.left = nodes[value[0]]
            nodes[key]?.right = nodes[value[1]]
        }
        
        return head
    }
    
    public func start() {
        // NOTE: The following values will be used for testing your solution.
        
        // The mapping we're going to use for constructing a tree.
        // {0: [1, 2]} means that 0's left child is 1, and its right
        // child is 2
//        let mapping1 = [(0, [1, 2]), (1, [3, 4]), (2, [5, 6])]
        let mapping1 = [(0, [1, 2]), (1, [3, 4]), (2, [5, 6])]
        let head1 = create_tree(mapping1, 0)
        // This tree is:
        // head1 = 0
        //        / \
        //       1   2
        //      /\   /\
        //     3  4 5  6
        
        
        let mapping2 = [(5, [1, 4]), (1, [3, 8]), (4, [9, 2]), (3, [6, 7])]
        let head2 = create_tree(mapping2, 5)
        // This tree is:
        //  head2 = 5
        //        /   \
        //       1     4
        //      /\    / \
        //     3  8  9  2
        //    /\
        //   6  7
        
        
        print(lca3(head1, 1, 5))// should return 0
        print(lca3(head1, 3, 1))// should return 1
        print(lca3(head1, 1, 4))// should return 1
        print(lca3(head1, 0, 5))// should return 0
        print(lca3(head2, 4, 7))// should return 5
        print(lca3(head2, 3, 3))// should return 3
        print(lca3(head2, 8, 7))// should return 1
        print(lca3(head2, 3, 0))// should return None (0 does not exist in the tree)
    }
    
    // This tree is: 1, 5 --> 0
    // This tree is:
    //  head2 = 5
    //        /   \
    //       1     4
    //      /\    / \
    //     3  8  9  2
    //    /\
    //   6  7

    
    private func lca(_ head: Node, _ value1: Int, _ value2: Int) -> Int? {
        if value1 == value2 { return value1 }
        //BFS search entire tree
        //keeping track of the level that is a common ancestor, keep going through tree
        //update common ancestor as move through tree if the values are found in the search
        var queue = [head]
        var ancestor: Node?
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if dfs(node, value1) && dfs(node, value2) {
                ancestor = node
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        
        return ancestor?.value
    }
    
    private func dfs(_ head: Node, _ value: Int) -> Bool {
        if head.value == value { return true }
        
        var leftExists = false
        var rightExists = false
        if let left = head.left {
            leftExists = dfs(left, value)
        }
        if !leftExists, let right = head.right {
            rightExists = dfs(right, value)
        }
        
        return leftExists || rightExists
    }
    
    //3
    private func lca3(_ head: Node, _ value1: Int, _ value2: Int) -> Int? {
        let path1 = path(head, value1)
        let path2 = path(head, value2)
        
        if path1.count == 0 || path2.count == 0 {
            return nil
        }
        
        for element in path1 {
            if path2.contains(element) {
                return element
            }
        }
        
        return nil
    }
    
    private func path(_ head: Node, _ value: Int) -> [Int] {
        var currentPath = [Int]()
        
        if head.value == value {
            currentPath.append(head.value)
            return currentPath
        }
        
        if let left = head.left {
            let leftPath = path(left, value)
            if leftPath.count > 0 {
                currentPath = leftPath
                currentPath.append(head.value)
                return currentPath
            }
        }
        
        if let right = head.right {
            let rightPath = path(right, value)
            if rightPath.count > 0 {
                currentPath = rightPath
                currentPath.append(head.value)
                return currentPath
            }
        }
        
        return currentPath
    
    }
}
