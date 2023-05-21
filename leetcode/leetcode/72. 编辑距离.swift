//
//  72. 编辑距离.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/20.
//

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    let n = word1.count
    let m = word2.count
    let chars1 = Array(word1)
    let chars2 = Array(word2)
    
    if m * n == 0 {
        return m + n
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
    for i in 0 ... n {
        dp[i][0] = i
    }
    
    for j in 0 ... m {
        dp[0][j] = j
    }
    
    for i in 1 ... n {
        for j in 1 ... m {
            let l = dp[i - 1][j] + 1
            let d = dp[i][j - 1] + 1
            var ld = dp[i - 1][j - 1]
            if chars1[i - 1] != chars2[j - 1] {
                ld += 1
            }
            dp[i][j] = min(l, min(d, ld))
        }
    }
    
    return dp[n][m]
}
