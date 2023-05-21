//
//  探索地块建立.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

// 压缩矩阵
func dikuaijianli() {
    while let line = readLine() {
        let nmck = line.split(separator: " ").map { Int($0)! }
        let n = nmck[0]
        let m = nmck[1]
        let c = nmck[2]
        let k = nmck[3]
        
        var matrix: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let nums = line.split(separator: " ").map { Int($0)! }
                matrix.append(nums)
            }
        }
        
        var mhzip = Array(repeating: Array(repeating: 0, count: m - c + 1) , count: n)
        for i in 0 ..< mhzip.count {
            for j in 0 ..< mhzip[i].count {
                var sum = 0
                for l in j ..< j + c {
                    sum += matrix[i][l]
                }
                mhzip[i][j] = sum
            }
        }
        
        var mvzip = Array(repeating: Array(repeating: 0, count: m - c + 1) , count: n - c + 1)
        for i in 0 ..< mvzip.count {
            for j in 0 ..< mvzip[i].count {
                var sum = 0
                for l in i ..< i + c {
                    sum += mhzip[l][j]
                }
                mvzip[i][j] = sum
            }
        }
        
        var ans = 0
        mvzip.forEach {
            $0.forEach {
                ans += ($0 >= 4 ? 1 : 0)
            }
        }
        
        print(ans)
    }
}
