//
//  647. 回文子串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func countSubstrings(_ s: String) -> Int {
    let chars = Array(s)
    let n = chars.count
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    var ans = 0
    for i in chars.indices.reversed() {
        for j in i ..< n where chars[i] == chars[j] {
            if j - i <= 1 {
                ans += 1
                dp[i][j] = true
            } else if dp[i + 1][j - 1] {
                ans += 1
                dp[i][j] = true
            }
        }
    }
    return ans
}
