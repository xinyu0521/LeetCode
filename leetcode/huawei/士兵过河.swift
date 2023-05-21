//
//  士兵过河.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation


func shibingguohe() {
    while let line1 = readLine(),
          let line2 = readLine(),
          let line3 = readLine() {
        
        let n = Int(line1)!
        let t = Int(line2)!
        let times = line3.split(separator: " ").map { Int($0)! }.sorted(by: <)
        
        var dp = Array(repeating: 0, count: n)
        dp[0] = times[0]
        dp[1] = min(times[1], times[0] * 10)
    
        for i in 2 ..< n {
            let t1 = dp[i - 1] + times[0] + getMinT(times[0], times[i])
            let t2 = dp[i - 2] + times[0] + times[1] + getMinT(times[i - 1], times[i]) + getMinT(times[0], times[1])
            dp[i] = min(t1, t2)
        }
        
        func getMinT(_ t1: Int, _ t2: Int) -> Int {
            if t1 * 10 < t2 {
                return t1 * 10
            }
            return t2
        }
        
        for i in dp.indices.reversed() {
            if dp[i] < t {
                print("\(i + 1) \(dp[i])")
                break
            }
        }
    }
}
