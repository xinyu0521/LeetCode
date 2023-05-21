//
//  计算网络信号、信号强度.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func jisuanxinhaoqingdu() {
    while let line1 = readLine(),
          let line2 = readLine(),
          let line3 = readLine() {
        
        let mn = line1.split(separator: " ").map { Int($0)! }
        let m = mn[0]
        let n = mn[1]
        let nums = line2.split(separator: " ").map { Int($0)! }
        let target = line3.split(separator: " ").map { Int($0)! }
        
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        var queue: ArraySlice<(i: Int, j: Int)> = []
        
        for i in nums.indices {
            matrix[i / n][i % n] = nums[i]
            if nums[i] > 0 {
                queue.append((i / n, i % n))
            }
        }
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let nexts = [(i: first.i + 1, j: first.j),
                         (i: first.i - 1, j: first.j),
                         (i: first.i, j: first.j + 1),
                         (i: first.i, j: first.j - 1),]
            for next in nexts where (0..<m).contains(next.i) && (0..<n).contains(next.j) && matrix[next.i][next.j] == 0 {
                matrix[next.i][next.j] = matrix[first.i][first.j] - 1
                if matrix[next.i][next.j] > 1 {
                    queue.append(next)
                }
            }
        }
        
        print(matrix[target[0]][target[1]])
    }
}
