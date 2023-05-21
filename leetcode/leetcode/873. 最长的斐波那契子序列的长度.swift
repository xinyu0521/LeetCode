//
//  873. 最长的斐波那契子序列的长度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/9.
//

import Foundation

func lenLongestFibSubseq(_ arr: [Int]) -> Int {
    let n = arr.count
    var dp = Array(repeating: [Int: Int](), count: n)
    dp[1][arr[0] + arr[1]] = 3
    var ans = 0
    for i in 2 ..< n {
        for j in 0 ..< i {
            if let l = dp[j][arr[i]] {
                ans = max(ans, l)
                dp[i][arr[i] + arr[j]] = l + 1
            } else {
                dp[i][arr[i] + arr[j]] = 3
            }
        }
    }
    return ans
}
