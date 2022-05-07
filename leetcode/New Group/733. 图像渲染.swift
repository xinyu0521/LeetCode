//
//  733. 图像渲染.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/6.
//

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var ans = image
    let num = ans[sr][sc]
    
    if newColor == num { return ans }
    
    let maxRow = image.count
    let maxCloumn = image[0].count

    func fill(_ row: Int, _ column: Int) {
        if !(0 ..< maxRow).contains(row) || !(0 ..< maxCloumn).contains(column) || ans[row][column] != num {
            return
        }
        
        ans[row][column] = newColor
        fill(row - 1, column)
        fill(row + 1, column)
        fill(row, column - 1)
        fill(row, column + 1)
    }
    
    fill(sr, sc)
    return ans
}
