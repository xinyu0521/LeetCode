//
//  73. 矩阵置零.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/5.
//

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    
    var row0Flag = false
    var column0Flag = false
    
    for n in matrix[0] where n == 0 {
        row0Flag = true
        break
    }
    
    for columns in matrix where columns[0] == 0 {
        column0Flag = true
        break
    }
    
    for row in 1 ..< matrix.count {
        for column in 1 ..< matrix[row].count where matrix[row][column] == 0 {
            matrix[0][column] = 0
            matrix[row][0] = 0
        }
    }
    
    for row in 1 ..< matrix.count {
        for column in 1 ..< matrix[row].count where matrix[0][column] == 0 || matrix[row][0] == 0 {
            matrix[row][column] = 0
        }
    }
    
    if row0Flag {
        for i in 0 ..< matrix[0].count {
            matrix[0][i] = 0
        }
    }
    
    if column0Flag {
        for i in 0 ..< matrix.count {
            matrix[i][0] = 0
        }
    }
}
