//
//  LinkedListKthValue.swift
//  ExampleInterviewQuestions
//
//  Created by Carla on 25/12/2018.
//  Copyright © 2018 Carla Goldstein. All rights reserved.
//

import Foundation

class LinkedListKthValue {
    class Node {
        var value: Int
        var next: Node?
        
        init(_ value: Int, _ next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    
    public func start() {
        // NOTE: The following input values will be used for testing your solution.
        var current = Node(1)
        for i in 2..<8 {
            current = Node(i, current)
        }
        let head = current

        // head = 7 -> 6 -> 5 -> 4 -> 3 -> 2 -> 1 -> (None)
        
        var current2 = Node(4)
        for i in (1...3).reversed(){
            current2 = Node(i, current2)
        }
        let head2 = current2
        
        // head2 = 1 -> 2 -> 3 -> 4 -> (None)
        
        
        print(nth_from_last(head, 1) ) //should return 1.
        print(nth_from_last(head, 5) ) //should return 5.
        print(nth_from_last(head2, 2)) // should return 3.
        print(nth_from_last(head2, 4)) // should return 1.
        print(nth_from_last(head2, 5)) // should return None.
//        print(nth_from_last(None, 1) ) //should return None.
    }
    
    // head2 = 1 -> 2 -> 3 -> 4 -> nil

    func nth_from_last(_ head: Node, _ n: Int) -> Int? {
        var rightNode: Node? = head
        var leftNode: Node? = head
        
        var left = 0
        var right = 0
        
        var value = leftNode?.value
        while rightNode != nil {
            
            if (right - left) == n {
                left += 1
                leftNode = leftNode?.next
                value = leftNode?.value
            }
            right += 1
            
            rightNode = rightNode?.next
            
            if rightNode?.value == nil {
                if (right - left) == n {
                    return value ?? -1
                } else {
                    return nil
                }
            }
        }
        return nil
    }
}
