//
//  荒地.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func huangdifadian() {
    while let line = readLine() {
        let nmlt = line.split(separator: " ").map { Int($0)! }
        let n = nmlt[0]
        let m = nmlt[1]
        let l = nmlt[2]
        let t = nmlt[3]
        
        var matrix: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                matrix.append(line.split(separator: " ").map { Int($0)! })
            }
        }
        
        var presum: [[Int]] = []
        for m in matrix {
            var arr: [Int] = []
            for n in m {
                if arr.isEmpty {
                    arr.append(n)
                } else {
                    arr.append(n + arr.last!)
                }
            }
            presum.append(arr)
        }
        
        var ans = 0
        
        for i in 0 ... n - l {
            for j in 0 ... m - l {
                var sum = 0
                for a in 0 ..< l {
                    sum += presum[i + a][j + l - 1] - (j == 0 ? 0 : presum[i + a][j - 1])
                }
                if sum >= t {
                    ans += 1
                }
            }
        }
        
        print(ans)
    }
}
