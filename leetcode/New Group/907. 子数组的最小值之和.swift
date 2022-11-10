//
//  907. 子数组的最小值之和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/28.
//

import Foundation

func sumSubarrayMins(_ arr: [Int]) -> Int {
    let n = arr.count
    var stack: [Int] = []
    var left = Array(repeating: 0, count: n)
    var right = Array(repeating: 0, count: n)
    
    for (i, num) in arr.enumerated() {
        while !stack.isEmpty, arr[stack.last!] >= num {
            stack.removeLast()
        }
        left[i] = i - (stack.isEmpty ? -1 : stack.last!)
        stack.append(i)
    }
    
    stack.removeAll()
    
    for (i, num) in arr.enumerated().reversed() {
        while !stack.isEmpty, arr[stack.last!] > num {
            stack.removeLast()
        }
        right[i] = (stack.isEmpty ? n : stack.last!) - i
        stack.append(i)
    }
    
    var ans = 0
    let mod = 1000000007
    for i in 0 ..< n {
        ans += (left[i] * right[i] * arr[i]) % mod
    }
    
    return ans
}
