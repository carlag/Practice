//
//  CheckIsBinaryTree.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 26/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class CheckIsBinarySearchTree {
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
        // child is 2.
        let mapping1 = [(0, [1, 2]), (1, [3, 4]), (2, [5, 6])]
        let mapping2 = [(3, [1, 4]), (1, [0, 2]), (4, [5, 6])]
        let mapping3 = [(3, [1, 5]), (1, [0, 2]), (5, [4, 6])]
        let mapping4 = [(3, [1, 5]), (1, [0, 4])]
        let head1 = create_tree(mapping1, 0)
        // This tree is:
        //  head1 = 0
        //        /   \
        //       1     2
        //      /\    / \
        //     3  4  5   6
        let head2 = create_tree(mapping2, 3)
        // This tree is:
        //  head2 = 3
        //        /   \
        //       1     4
        //      /\    / \
        //     0  2  5   6
        let head3 = create_tree(mapping3, 3)
        // This tree is:
        //  head3 = 3
        //        /   \
        //       1     5
        //      /\    / \
        //     0  2  4   6
        let head4 = create_tree(mapping4, 3)
        // This tree is:
        //  head4 = 3
        //        /   \
        //       1     5
        //      /\
        //     0  4
        
         print(is_bst(head1)) //should return False
         print(is_bst(head2)) //should return False
         print(is_bst(head3)) //should return True
         print(is_bst(head4)) //should return False
    }
    
    // This tree is:
    //  head2 = 3
    //        /   \
    //       1     4
    //      /\    / \
    //     0  2  5   6
    private func is_bst(_ head: Node, _ lowerLimit: Int? = nil, _ upperLimit: Int? = nil) -> Bool {
        //left side
        if let lowerLimit = lowerLimit,
            head.value < lowerLimit {
            return false
        }
        
        //right side
        if let upperLimit = upperLimit,
            head.value > upperLimit {
            return false
        }
        
        var leftIsBST = true
        var rightIsBST = true
        if let left = head.left {
            leftIsBST = is_bst(left, lowerLimit, head.value)
        }
        
        if leftIsBST, let right = head.right {
            rightIsBST = is_bst(right, head.value, upperLimit)
        }
        
        return leftIsBST && rightIsBST
        
        //LEFT SIDE
        //check left node is between lower and upper limit
        //if yes, leftIsBST = is_bst(left, leftValue, nodeValue)
        //if no, return false
        
        
        //RIGHT SIDE
        //check right node is between lower and upper limit
        //if yes, rightIsBST = is_bst(right, nodeValue, rightValue)
        //if no, return false
        
        //right Left and Right are BST
        
        
    }
    

    

}
