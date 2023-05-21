//
//  计算快递主站点.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func jisuankuaidizhuzhandian() {
    while let line = readLine() {
        let n = Int(line)!
        var matrix: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                matrix.append(line.split(separator: " ").map({ Int($0)! }))
            }
        }
        
        var uf = Array(0 ..< n)
        var count = n
        
        func find(_ i: Int) -> Int {
            if i != uf[i] {
                uf[i] = find(uf[i])
            }
            return uf[i]
        }
        
        func union(_ i: Int, _ j: Int) {
            let uf_i = find(i)
            let uf_j = find(j)
            if uf_i != uf_j {
                uf[uf_j] = uf_i
                count -= 1
            }
        }
        
        for i in 0 ..< n {
            for j in i ..< n {
                if matrix[i][j] == 1 {
                    union(i, j)
                }
            }
        }
        
        print(count)
    }
}
