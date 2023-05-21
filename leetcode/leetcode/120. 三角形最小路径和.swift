//
//  120. 三角形最小路径和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/11.
//

import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    var dp = Array(repeating: [Int](), count: triangle.count)
    dp[0].append(triangle[0][0])
    
    for i in 1 ..< triangle.count {
        for j in 0 ..< triangle[i].count {
            var left = Int.max
            var right = Int.max
            if (0 ..< dp[i - 1].count).contains(j) {
                right = dp[i - 1][j] + triangle[i][j]
            }
            if (0 ..< dp[i - 1].count).contains(j - 1) {
                left = dp[i - 1][j - 1] + triangle[i][j]
            }
            
            dp[i].append(min(left, right))
        }
    }
    
    return dp.last?.min() ?? 0
}
