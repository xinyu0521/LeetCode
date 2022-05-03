//
//  122. 买卖股票的最佳时机 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/14.
//

import Foundation

func maxProfit2(_ prices: [Int]) -> Int {
    var dp = Array(repeating: (hold: 0, canBuy: 0), count: prices.count)
    dp[0] = (hold: -prices[0], canBuy: 0)
    var res = 0
    for i in 1 ..< prices.count {
        let pre = dp[i - 1]
        dp[i].hold = max(pre.hold, pre.canBuy - prices[i])
        dp[i].canBuy = max(pre.canBuy, pre.hold + prices[i])
        res = max(res, dp[i].canBuy)
    }
    
    return res
}
