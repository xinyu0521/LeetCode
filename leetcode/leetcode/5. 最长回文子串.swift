//
//  5. 最长回文子串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/18.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    let chars = Array(s)
    let n = chars.count
    
    if n < 2 {
        return s
    }
    
    var begin = 0;
    var maxL = 1;
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    for i in 0 ..< n {
        dp[i][i] = true
    }
    
    for l in 2 ... n {
        for i in 0 ..< n {
            let j = i + l - 1
            if j >= n {
                break
            }
            
            if chars[i] == chars[j] {
                if l == 2 {
                    dp[i][j] = true
                } else {
                    dp[i][j] = dp[i + 1][j - 1]
                }
            } else {
                dp[i][j] = false
            }
            
            if dp[i][j], j - i + 1 > maxL {
                maxL = j - i + 1
                begin = i
            }
        }
    }
    
    return String(chars[begin ..< begin + maxL])
}
