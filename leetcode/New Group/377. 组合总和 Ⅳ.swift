//
//  377. 组合总和 Ⅳ.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var dp = Array(repeating: 0, count: target + 1)
    dp[0] = 1
    
    for i in dp.indices {
        for num in nums where i >= num && dp[i] < Int.max - dp[i - num] {
            dp[i] += dp[i - num]
        }
    }
    
    return dp.last!
}
