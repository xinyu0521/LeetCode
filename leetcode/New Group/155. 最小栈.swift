//
//  155. 最小栈.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

class MinStack {
    
    var stack: [(val: Int, min: Int)] = []

    init() {

    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
        } else {
            stack.append((val, min(stack.last!.min, val)))
        }
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last!.val
    }
    
    func getMin() -> Int {
        stack.last!.min
    }
}
