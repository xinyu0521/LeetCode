//
//  机器人.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func jiqiren() {
    while let line = readLine() {
        let mn = line.split(separator: " ").map { Int($0)! }
        let m = mn[0]
        let n = mn[1]
        
        var matrix: [[Int]] = []
        
        for _ in 0 ..< n {
            if let line = readLine() {
                let nums = line.split(separator: " ").map { Int($0)! }
                matrix.append(nums)
            }
        }
        
        var uf = Array(0 ..< m * n)
        
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
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                let nexts = [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)]
                for (p, q) in nexts where (0..<n).contains(p) && (0..<m).contains(q) {
                    if abs(matrix[i][j] - matrix[p][q]) <= 1 {
                        union(i * n + j, p * n + q)
                    }
                }
            }
        }
        
        for i in 0 ..< uf.count {
            _ = find(i)
        }
        
        var ans = 0
        
        uf.reduce(into: [Int: Int]()) {
            $0[$1, default: 0] += 1
        }.forEach {
            ans = max(ans, $0.value)
        }
        
        print(ans)
    }
}
