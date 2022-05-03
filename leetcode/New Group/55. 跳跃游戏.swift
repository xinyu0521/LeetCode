//
//  55. 跳跃游戏.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    var dp = Array(repeating: false, count: nums.count)
    dp[0] = true
    for i in 0 ..< nums.count {
        if dp[i] == false { continue }
        for j in 0 ... nums[i] {
            if j + i >= nums.count { return true}
            dp[j + i] = true
        }
    }
    
    return dp[nums.count - 1]
}
