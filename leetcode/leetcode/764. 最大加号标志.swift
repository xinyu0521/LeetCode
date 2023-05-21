//
//  764. 最大加号标志.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/11/9.
//

import Foundation

func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
    let banned = Set(mines)
    var dp = Array(repeating: Array(repeating: n, count: n), count: n)
    var ans = 0
    for i in 0 ..< n {
        var count = 0
        for j in 0 ..< n {
            if banned.contains([i, j]) {
                count = 0
            } else {
                count += 1
            }
            dp[i][j] = min(dp[i][j], count)
        }
        count = 0
        for j in (0 ..< n).reversed() {
            if banned.contains([i, j]) {
                count = 0
            } else {
                count += 1
            }
            dp[i][j] = min(dp[i][j], count)
        }
    }
    
    for j in 0 ..< n {
        var count = 0
        for i in 0 ..< n {
            if banned.contains([i, j]) {
                count = 0
            } else {
                count += 1
            }
            dp[i][j] = min(dp[i][j], count)
        }
        count = 0
        for i in (0 ..< n).reversed() {
            if banned.contains([i, j]) {
                count = 0
            } else {
                count += 1
            }
            dp[i][j] = min(dp[i][j], count)
            ans = max(ans, dp[i][j])
        }
    }
    
    return ans
}
