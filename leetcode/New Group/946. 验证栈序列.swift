//
//  946. 验证栈序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/31.
//

import Foundation

func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    var stack: [Int] = []
    var index = 0
    for i in pushed {
        stack.append(i)
        while !stack.isEmpty,
              stack.last! == popped[index] {
            index += 1
            stack.removeLast()
        }
    }
    return index == popped.count
}
