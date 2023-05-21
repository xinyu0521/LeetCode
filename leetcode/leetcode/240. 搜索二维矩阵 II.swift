//
//  240. 搜索二维矩阵 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    let n = matrix[0].count
    
    var i = 0
    var j = n - 1
    
    while i < m && j >= 0 {
        let val = matrix[i][j]
        if val == target {
            return true
        } else if val > target {
            j -= 1
        } else {
            i += 1
        }
    }
    
    return false
}
