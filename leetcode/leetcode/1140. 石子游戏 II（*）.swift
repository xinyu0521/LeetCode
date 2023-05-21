//
//  1140. 石子游戏 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func stoneGameII(_ piles: [Int]) -> Int {
    let n = piles.count
    var preSum = Array(repeating: 0, count: n + 1)
    for i in 0 ..< n {
        preSum[i + 1] = preSum[i] + piles[i]
    }
    
    var cache = Array(repeating: Array(repeating: -1, count: n + 1), count: n)
    
    func dfs(_ i: Int, _ m: Int) -> Int {
        if m * 2 >= n - i {
            return preSum[n] - preSum[i]
        }
        
        if cache[i][m] != -1 {
            return cache[i][m]
        }
        
        var ans = 0
        for x in 1 ... m * 2 {
            ans = max(ans, preSum[n] - preSum[i] - dfs(i + x, max(m, x)))
        }
        
        cache[i][m] = ans
        return ans
    }
    
    return dfs(0, 1)
}
