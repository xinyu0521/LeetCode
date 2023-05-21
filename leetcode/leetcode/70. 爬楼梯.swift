//
//  70. 爬楼梯.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    var dp: [Int] = Array(repeating: 0, count: n)
    dp[0] = 1
    dp[1] = 2
    
    for i in 2 ..< n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    
    return dp.last!
}
