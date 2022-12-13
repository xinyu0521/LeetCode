//
//  714. 买卖股票的最佳时机含手续费.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/14.
//

import Foundation

func maxProfitd_dp(_ prices: [Int], _ fee: Int) -> Int {
    var dp = Array(repeating: (hold: 0, canBuy: 0), count: prices.count)
    dp[0] = (hold: -prices[0], canBuy: 0)
    var res = 0
    for i in 1 ..< prices.count {
        let pre = dp[i - 1]
        dp[i].hold = max(pre.hold, pre.canBuy - prices[i])
        dp[i].canBuy = max(pre.canBuy, pre.hold + prices[i] - fee)
        res = max(res, dp[i].canBuy)
    }
    
    return res
}

func maxProfitd(_ prices: [Int], _ fee: Int) -> Int {
    var ans = 0
    var buy = prices[0] + fee
    
    for price in prices.dropFirst() {
        if price + fee < buy {
            buy = price + fee
        } else if price > buy {
            ans += price - buy
            buy = price
        }
    }
    
    return ans
}
