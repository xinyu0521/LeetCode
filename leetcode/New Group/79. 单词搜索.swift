//
//  79. 单词搜索.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    var ans = false
    func backtracking(_ str: String, _ m: Int, _ n: Int) {
        
        if !word.hasPrefix(str) {
            return
        }
        
        if str == word {
            ans = true
        }
        
        visited[m][n] = true
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for (i, j) in directions {
            let nm = m + i
            let nn = n + j
            if board.indices.contains(nm),
               board[nm].indices.contains(nn),
               visited[nm][nn] == false {
                backtracking(str + String(board[nm][nn]), nm, nn)
            }
        }
        visited[m][n] = false
    }
    
    for m in board.indices {
        for n in board[m].indices {
            backtracking(String(board[m][n]), m, n)
        }
    }
    
    return ans
}
