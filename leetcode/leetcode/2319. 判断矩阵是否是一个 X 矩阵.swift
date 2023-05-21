//
//  2319. 判断矩阵是否是一个 X 矩阵.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/31.
//

import Foundation

func checkXMatrix(_ grid: [[Int]]) -> Bool {
    let n = grid.count
    for i in 0 ..< n {
        for j in 0 ..< n {
            if i == j || i + j == n - 1 {
                if grid[i][j] == 0 {
                    return false
                }
            } else {
                if grid[i][j] != 0 {
                    return false
                }
            }
        }
    }
    
    return true
}
