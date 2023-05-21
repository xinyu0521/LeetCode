//
//  1824. 最少侧跳次数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/21.
//

import Foundation

func minSideJumps(_ obstacles: [Int]) -> Int {
    var dp = [1, 0, 1]
    
    for i in obstacles.indices.dropFirst() {
        var minCnt = Int.max
        
        for j in 0 ..< 3 {
            if j == obstacles[i] - 1 {
                dp[j] = Int.max
            } else {
                minCnt = min(minCnt, dp[j])
            }
        }
        
        for j in 0 ..< 3 {
            if j != obstacles[i] - 1 {
                dp[j] = min(dp[j], minCnt + 1)
            }
        }
    }
    
    return min(dp[0], min(dp[1], dp[2]))
}
