//
//  36. 有效的数独.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/5.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var columns = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var boxes = Array(repeating: Array(repeating: Array(repeating: 0, count: 9), count: 3), count: 3)

    for row in 0 ..< board.count {
        for column in 0 ..< board[row].count {
            let c = board[row][column]
            if c == "." { continue }
            
            let i = Int(c.asciiValue!) - 49
            
            rows[row][i] += 1
            columns[column][i] += 1
            boxes[row / 3][column / 3][i] += 1
            
            if rows[row][i] > 1 || columns[column][i] > 1 || boxes[row / 3][column / 3][i] > 1 {
                return false
            }
        }
    }
    
    return true
}
