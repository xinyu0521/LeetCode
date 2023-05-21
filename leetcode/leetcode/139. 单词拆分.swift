//
//  139. 单词拆分.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/16.
//

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    var dp = Array(repeating: false, count: s.count + 1)
    dp[0] = true
    
    for i in 1 ..< dp.count {
        for j in 0 ..< i {
            let str = String(s[s.index(s.startIndex, offsetBy: j) ..< s.index(s.startIndex, offsetBy: i)])
            if set.contains(str) && dp[j] {
                dp[i] = true
            }
        }
    }
    
    return dp.last!
}
