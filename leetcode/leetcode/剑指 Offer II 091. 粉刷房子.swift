//
//  剑指 Offer II 091. 粉刷房子.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/25.
//

import Foundation

func minCost(_ costs: [[Int]]) -> Int {
    var dp: [(red: Int, blue: Int, green: Int)] = Array(repeating: (0, 0, 0), count: costs.count)
    dp[0] = (costs[0][0], costs[0][1], costs[0][2])
    
    for (i, cost) in costs.enumerated().dropFirst() {
        dp[i].red = cost[0] + min(dp[i - 1].green, dp[i - 1].blue)
        dp[i].blue = cost[1] + min(dp[i - 1].red, dp[i - 1].green)
        dp[i].green = cost[2] + min(dp[i - 1].red, dp[i - 1].blue)
    }
    
    let last = dp[dp.count - 1]
    
    return min(last.red, min(last.blue, last.green))
}
