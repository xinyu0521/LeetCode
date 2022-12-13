//
//  279. 完全平方数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func numSquares(_ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: n + 1)
    dp[0] = 0
    
    for j in 1 ..< dp.count {
        var i = 1
        while i * i <= j {
            dp[j] = min(dp[j], dp[j - i * i] + 1)
            i += 1
        }
    }
    
    return dp.last!
}
