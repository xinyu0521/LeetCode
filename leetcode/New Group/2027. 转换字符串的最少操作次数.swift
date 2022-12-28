//
//  2027. 转换字符串的最少操作次数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/27.
//

import Foundation

func minimumMoves(_ s: String) -> Int {
    let chars = Array(s)
    let n = chars.count
    var i = 0
    var ans = 0
    
    while i < n {
        if chars[i] == "X" {
            i += 3
            ans += 1
        } else {
            i += 1
        }
    }
    
    return ans
}
