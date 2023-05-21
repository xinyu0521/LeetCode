//
//  1691. 堆叠长方体的最大高度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/10.
//

import Foundation

func maxHeight(_ cuboids: [[Int]]) -> Int {
    let cuboids = cuboids
        .sorted { ($0[0] + $0[1] + $0[2]) < ($1[0] + $1[1] + $1[2]) }
        .map { $0.sorted() }
    let n = cuboids.count
    var dp = Array(repeating: 0, count: n)
    var ans = 0
    
    for i in dp.indices {
        dp[i] = cuboids[i][2]
        for j in 0 ..< i {
            if cuboids[j][0] <= cuboids[i][0],
               cuboids[j][1] <= cuboids[i][1],
               cuboids[j][2] <= cuboids[i][2] {
                dp[i] = max(dp[i], dp[j] + cuboids[i][2])
            }
        }
        ans = max(ans, dp[i])
    }
    
    return ans
}
