//
//  556. 下一个更大元素 III.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/3.
//

import Foundation

func nextGreaterElement(_ n: Int) -> Int {
    var nums: [Int] = []
    var n = n
    while n > 0 {
        nums.append(n % 10)
        n /= 10
    }
    
    var stack: [Int] = []
    var find = false
    var index = 0
    for (i, num) in nums.enumerated() {
        if stack.isEmpty || num >= nums[stack.last!] {
            stack.append(i)
            continue
        }
        var j = 0
        while !stack.isEmpty, num < nums[stack.last!] {
            j = stack.removeLast()
        }
        nums.swapAt(i, j)
        index = i
        find = true
        break
    }
    
    if !find { return -1 }
    
    var res = 0
    
    for num in nums[index ..< nums.count].reversed() {
        res = res * 10 + num
    }
    
    for num in nums[0 ..< index] {
        res = res * 10 + num
    }
    
    if res > (1 << 32) {
        return -1
    }
    
    return res
}
