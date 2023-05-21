//
//  基站维护工程师.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func jizhanweihugongchengshi() {
    while let line = readLine() {
        let n = Int(line)!
        var matrix: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                matrix.append(line.split(separator: " ").map { Int($0)! })
            }
        }
        
        var ans = Int.max
        
        func backtracking(_ used: Set<Int>, _ path: [Int], _ begin: Int) {
            if path.count == n - 1 {
                let sum = path.reduce(0, +) + matrix[begin][0]
                ans = min(ans, sum)
                return
            }
            
            for i in 1 ..< n {
                if used.contains(i) {
                    continue
                }
                backtracking(used.union([i]), path + [matrix[begin][i]], i)
            }
        }
        
        backtracking([], [], 0)
        
        print(ans)
    }
}
