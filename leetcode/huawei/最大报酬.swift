//
//  最大报酬.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/27.
//

import Foundation

func zuidabaochou() {
    while let line = readLine() {
        let tn = line.split(separator: " ").map { Int($0)! }
        let t = tn[0]
        let n = tn[1]
        var works: [(Int, Int)] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let w = line.split(separator: " ").map { Int($0)! }
                works.append((w[0], w[1]))
            }
        }
        
        var dp: [Int] = Array(repeating: 0, count: t + 1)
        for (wt, ww) in works {
            for i in (1 ... t).reversed() where wt <= i {
                dp[i] = max(dp[i], dp[i - wt] + ww)
            }
        }
        
        print(dp.last!)
    }
}
