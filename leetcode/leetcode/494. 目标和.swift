//
//  494. 目标和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    
    let sum = nums.reduce(0, +)
    if target > sum { return 0 }
    if (target + sum) % 2 == 1 { return 0 }
    var dp = Array(repeating: 0, count: (target + sum) / 2 + 1)
    dp[0] = 1
    
    for num in nums {
        for i in dp.indices.reversed() where num < dp.count && i >= num {
            dp[i] += dp[i - num]
        }
    }
    
    return dp.last!
}
