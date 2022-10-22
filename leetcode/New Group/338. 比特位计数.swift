//
//  338. 比特位计数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/19.
//

import Foundation

func countBits(_ n: Int) -> [Int] {
    var dp = Array(repeating: 0, count: n + 1)
    for i in 1 ... n {
        if i % 2 == 1 {
            dp[i] = dp[i - 1] + 1
        } else {
            dp[i] = dp[i / 2]
        }
    }
    return dp
}
