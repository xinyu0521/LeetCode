//
//  416. 分割等和子集.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/5.
//

import Foundation

func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    if sum % 2 == 1 { return false }
    let target = sum / 2
    
    var dp: [Int] = Array(repeating: 0, count: target + 1)
    
    for num in nums {
        for i in (1 ..< dp.count).reversed() where i >= num {
            dp[i] = max(dp[i], dp[i - num] + num)
        }
    }
    
    return dp[target] == target
}
