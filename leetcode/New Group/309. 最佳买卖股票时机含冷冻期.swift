//
//  309. 最佳买卖股票时机含冷冻期.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/14.
//

import Foundation

func maxProfit3(_ prices: [Int]) -> Int {
    var dp = Array(repeating: (hold: 0, sold: 0, cooldown: 0), count: prices.count)
    dp[0] = (hold: -prices[0], sold: 0, cooldown: 0)
    for i in 1 ..< prices.count {
        let pre = dp[i - 1]
        dp[i].hold = max(pre.hold, pre.sold - prices[i])
        dp[i].sold = max(pre.cooldown, pre.sold)
        dp[i].cooldown = pre.hold + prices[i]
    }
    
    return max(dp[prices.count - 1].sold, dp[prices.count - 1].cooldown)
}
