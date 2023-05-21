//
//  741. 摘樱桃.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/10.
//

import Foundation

func cherryPickup(_ grid: [[Int]]) -> Int {
    let n = grid.count
    var f = Array(repeating:Array(repeating: Array(repeating: Int.min, count: n), count: n) , count: n * 2 - 1)
    f[0][0][0] = grid[0][0]
    
    for k in 1 ..< n * 2 - 1 {
        for x1 in max(k - n + 1, 0) ... min(k, n - 1) {
            let y1 = k - x1
            if grid[x1][y1] == -1 {
                continue
            }
            for x2 in x1 ... min(k, n - 1) {
                let y2 = k - x2
                if grid[x2][y2] == -1 {
                    continue
                }
                
                var res = f[k - 1][x1][x2]
                
                if x1 > 0 {
                    res = max(res, f[k - 1][x1 - 1][x2])
                }
                
                if x2 > 0 {
                    res = max(res, f[k - 1][x1][x2 - 1])
                }
                
                if x1 > 0, x2 > 0 {
                    res = max(res, f[k - 1][x1 - 1][x2 - 1])
                }
                
                res += grid[x1][y1]
                if x1 != x2 {
                    res += grid[x2][y2]
                }
                
                f[k][x1][x2] = res
            }
        }
    }
    
    return max(f[n * 2 - 2][n - 1][n - 1], 0)
}
