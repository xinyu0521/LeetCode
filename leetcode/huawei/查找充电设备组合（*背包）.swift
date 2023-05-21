//
//  查找充电设备组合.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func chazhaochogndianshebeizuhe() {
    while let line1 = readLine(),
          let line2 = readLine(),
          let line3 = readLine() {
        let n = Int(line1)!
        let ps = line2.split(separator: " ").map { Int($0)! }
        let p_max = Int(line3)!
        
        var dp = Array(repeating: 0, count: p_max + 1)
        
        for i in 0 ..< n {
            for j in (1 ... p_max).reversed() where j >= ps[i] {
                dp[j] = max(dp[j], dp[j - ps[i]] + ps[i])
            }
        }
        
        print(dp[p_max])
    }
}
