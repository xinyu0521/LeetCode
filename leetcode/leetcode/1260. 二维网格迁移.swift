//
//  1260. 二维网格迁移.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/20.
//

import Foundation

func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    let m = grid.count
    let n = grid[0].count
    var res = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for j in 0 ..< n {
        for i in 0 ..< m {
            res[(i + (j + k) / n) % m][(j + k) % n] = grid[i][j]
        }
    }
    
    return res
}
