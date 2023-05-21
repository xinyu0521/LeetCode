//
//  385. 迷你语法分析器.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/15.
//

import Foundation

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 */
class NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool {
        return true
    }

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int {
        return 0
    }

    // Set this NestedInteger to hold a single integer.
    public func setInteger(_ value: Int) {
        
    }

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(_ elem: NestedInteger) {
        
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] {
        return [NestedInteger()]
    }
}

func deserialize(_ s: String) -> NestedInteger {
//    var res: NestedInteger?
    var stack: [NestedInteger] = []
    
    var str = ""
    
    for i in s {
        if i == "," || i == "]"{
            continue
        }
        
        if i == "[" {
            if str.isEmpty {
                continue
            }
            let nestedInt = NestedInteger()
            nestedInt.setInteger(Int(str)!)
            stack.append(nestedInt)
            str = ""
            continue
        }
        
        str.append(i)
    }
    
    let nestedInt = NestedInteger()
    nestedInt.setInteger(Int(str)!)
    stack.append(nestedInt)
    
    while stack.count > 1 {
        let last = stack.popLast()
        stack.last?.add(last!)
    }
    
    return stack.first!
}
