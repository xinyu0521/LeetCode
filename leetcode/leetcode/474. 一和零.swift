//
//  474. 一和零.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var cnts: [(m: Int, n: Int)] = []
    for str in strs {
        let m = str.filter { $0 == "0" }.count
        let n = str.count - m
        cnts.append((m, n))
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    for cnt in cnts {
        for i in (0 ... m).reversed() where i >= cnt.m {
            for j in (0 ... n).reversed() where j >= cnt.n {
                dp[i][j] = max(dp[i][j], dp[i - cnt.m][j - cnt.n] + 1)
            }
        }
    }
    
    return dp.last!.last!
}
