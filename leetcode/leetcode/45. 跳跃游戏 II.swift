//
//  45. 跳跃游戏 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/3.
//

import Foundation

func jump(_ nums: [Int]) -> Int {
    
    var dp = Array(repeating: 0, count: nums.count)
    dp[0] = 0
    for i in 1 ..< nums.count {
        var minSteps = Int.max
        for j in 0 ..< i {
            if j + nums[j] < i {
                continue
            }
            minSteps = min(minSteps, dp[j] + 1)
        }
        dp[i] = minSteps
    }
    
    return dp[nums.count - 1]
}
