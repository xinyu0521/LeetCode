//
//  322. 零钱兑换.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = Array(repeating: Int.max, count: amount + 1)
    dp[0] = 0
    
    for coin in coins {
        for i in dp.indices where i >= coin {
            if dp[i - coin] != Int.max {
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
    }
    
    return dp.last! == Int.max ? -1 : dp.last!
}
