//
//  48. 旋转图像.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0 ..< n / 2 {
        for j in 0 ..< (n + 1) / 2 {
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[n - j - 1][i]
            matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
            matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
            matrix[j][n - i - 1] = tmp
        }
    }
}
