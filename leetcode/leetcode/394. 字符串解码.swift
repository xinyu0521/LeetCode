//
//  394. 字符串解码.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func decodeString(_ s: String) -> String {
    let chars = Array(s)
    var stack: [Character] = []
    for c in chars {
        if c == "]" {
            var arr: [Character] = []
            while !stack.isEmpty, stack.last! != "[" {
                arr.append(stack.popLast()!)
            }
            stack.popLast()
            var nums: [Character] = []
            while !stack.isEmpty, stack.last!.isNumber {
                nums.append(stack.popLast()!)
            }
            var n = 0
            for num in nums.reversed() {
                n = n * 10 + (Int(num.asciiValue!) - 48)
            }
            
            arr.reverse()
            var newArr: [Character] = []
            for _ in 0 ..< n {
                newArr += arr
            }
            stack += newArr
        } else {
            stack.append(c)
        }
    }
    return String(stack)
}
