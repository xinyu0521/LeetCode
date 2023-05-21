//
//  1021. 删除最外层的括号.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/28.
//

import Foundation

func removeOuterParentheses(_ s: String) -> String {
    let chars = Array(s)
    var stack: [Character] = []
    var ans = ""
    
    for i in 0 ..< chars.count {
        let char = chars[i]
        if char == ")" {
            stack.removeLast()
        }
        
        if !stack.isEmpty {
            ans.append(char)
        }
        
        if char == "(" {
            stack.append(char)
        }
    }
    
    return ans
}
