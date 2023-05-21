//
//  剑指 Offer II 095. 最长公共子序列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/14.
//

import Foundation

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let text1s = Array(text1)
    let text2s = Array(text2)
    var dp = Array(repeating: Array(repeating: 0, count: text2s.count + 1), count: text1s.count + 1)
    
    for i in 1 ... text1s.count {
        for j in 1 ... text2s.count {
            if text1s[i - 1] == text2s[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    
    return dp[text1s.count][text2s.count]
}

