//
//  926. 将字符串翻转到单调递增.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/11.
//

import Foundation

func minFlipsMonoIncr(_ s: String) -> Int {
    var sum0 = 0
    var sum1 = 0
    let chars = Array(s)
    chars[0] == "0" ? (sum1 = 1) : (sum0 = 1)
    for i in 1 ..< chars.count {
        let c = chars[i]
        if c == "0" {
            sum1 = min(sum0, sum1) + 1
        } else {
            sum0 += 1
            sum1 = min(sum0, sum1)
        }
    }
    
    return min(sum0, sum1)
}
