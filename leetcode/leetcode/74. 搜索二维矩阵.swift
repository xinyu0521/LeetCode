//
//  74. 搜索二维矩阵.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/27.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let row = matrix.count
    let col = matrix[0].count
    var left = 0
    var right = row * col
    
    while left < right {
        let mid = left + (right - left) / 2
        let val = matrix[mid / col][mid % col]
        if val == target {
            return true
        }
        
        if val > target {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return false
}
