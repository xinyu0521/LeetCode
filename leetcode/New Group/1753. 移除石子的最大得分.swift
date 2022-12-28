//
//  1753. 移除石子的最大得分.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/21.
//

import Foundation

func maximumScore(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a + b == 0 || b + c == 0 || a + c == 0 {
        return 0
    }
    
    let nums = [a, b, c].sorted()
    
    return 1 + maximumScore(nums[0], nums[1] - 1, nums[2] - 1)
}

func maximumScor2(_ a: Int, _ b: Int, _ c: Int) -> Int {
    let sum = a + b + c
    let maxN = max(a, max(b, c))
    return min(sum - maxN, sum / 2)
}
