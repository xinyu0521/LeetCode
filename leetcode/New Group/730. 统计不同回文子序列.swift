//
//  730. 统计不同回文子序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/27.
//

import Foundation

func countPalindromicSubsequences(_ s: String) -> Int {
    let mod = 1000000007
    let n = s.count
    if n == 1 { return 1 }
    let chars = Array(s)
    let cs: [Character] = ["a", "b", "c", "d"]
    var dp = Array(
        repeating: Array(
            repeating: Array(
                repeating: 0,
                count: n),
            count: n),
        count: 4)
    
    for (i, c) in s.enumerated() {
        let k = Int(c.asciiValue! - 97)
        dp[k][i][i] = 1
    }
    
    for len in 2 ... n {
        for i in 0 ... n - len {
            let j = i + len - 1
            for c in cs {
                let k = Int(c.asciiValue! - 97)
                if chars[i] == c, chars[j] == c {
                    dp[k][i][j] = 2 + dp.reduce(0, { partialResult, d in
                        (partialResult + d[i + 1][j - 1]) % mod
                    })
                } else if chars[i] == c {
                    dp[k][i][j] = dp[k][i][j - 1]
                } else if chars[j] == c {
                    dp[k][i][j] = dp[k][i + 1][j]
                } else {
                    dp[k][i][j] = dp[k][i + 1][j - 1]
                }
            }
        }
    }
    
    return dp.reduce(0, { partialResult, d in
        (partialResult + d[0][n - 1]) % mod
    })
}
