//
//  518. 零钱兑换 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func change(_ amount: Int, _ coins: [Int]) -> Int {
    var dp = Array(repeating: 0, count: amount + 1)
    dp[0] = 1
    
    for coin in coins {
        for i in dp.indices where i >= coin {
            dp[i] = max(dp[i], dp[i - coin] + dp[i])
        }
    }
    
    return dp.last!
}
