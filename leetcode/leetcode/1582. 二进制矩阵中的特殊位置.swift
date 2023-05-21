//
//  1582. 二进制矩阵中的特殊位置.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/4.
//

import Foundation

func numSpecial(_ mat: [[Int]]) -> Int {
    let m = mat.count
    let n = mat[0].count
    
    var row: [Int] = Array(repeating: 0, count: n)
    var col: [Int] = Array(repeating: 0, count: m)
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            row[j] += mat[i][j]
            col[i] += mat[i][j]
        }
    }
    
    var ans = 0
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if mat[i][j] == 1,
               row[j] == 1,
               col[i] == 1 {
                ans += 1
            }
        }
    }
    
    return ans
}
