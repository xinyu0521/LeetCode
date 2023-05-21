//
//  746. 使用最小花费爬楼梯.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/7.
//

import Foundation

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    
    var dp = Array(repeating: -1, count: cost.count + 1)
    
    func minMon(_ n: Int) -> Int {
        if n < 2 { return 0 }
        if dp[n] != -1 { return dp[n]}
        let res =  min(cost[n - 2] + minMon(n - 2), cost[n - 1] + minMon(n - 1))
        dp[n] = res
        return res
    }
    
    return minMon(cost.count)
}
