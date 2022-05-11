//
//  232. 用栈实现队列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

class MyQueue {
    
    var inStack: [Int] = []
    var outStack: [Int] = []

    init() {

    }
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
       return outStack.popLast()!
    }
    
    func peek() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        return outStack.last!
    }
    
    func empty() -> Bool {
        inStack.isEmpty && outStack.isEmpty
    }
}
