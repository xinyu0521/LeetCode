//
//  566. 重塑矩阵.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    if mat.count * mat[0].count != r * c {
        return mat
    }
    
    var ans = Array(repeating: Array(repeating: 0, count: c), count: r)
    var i = 0
    for nums in mat {
        for num in nums {
            ans[i / c][i % c] = num
            i += 1
        }
    }
    
    return ans
}
