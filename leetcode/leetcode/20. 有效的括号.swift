//
//  20. 有效的括号.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

func isValid(_ s: String) -> Bool {
    let map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack: [Character] = []
    for char in s {
        if stack.isEmpty || stack.last != map[char] {
            stack.append(char)
        } else {
            stack.removeLast()
        }
    }
        
    return stack.isEmpty
}
