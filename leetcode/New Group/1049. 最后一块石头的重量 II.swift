//
//  1049. 最后一块石头的重量 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func lastStoneWeightII(_ stones: [Int]) -> Int {
    let sum = stones.reduce(0, +)
    let target = sum / 2
    
    var dp = Array(repeating: 0, count: target + 1)
    
    for stone in stones {
        for i in (0 ... target).reversed() where i >= stone {
            dp[i] = max(dp[i], dp[i - stone] + stone)
        }
    }
    
    return sum - dp.last! - dp.last!
}
