//
//  1759. 统计同构子字符串的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/26.
//

import Foundation

func countHomogenous(_ s: String) -> Int {
    let mod = 1000000007
    var ans = 1
    var l = 1
    var pre = s.first!
    
    for c in s.dropFirst() {
        if c == pre {
            l += 1
        } else {
            pre = c
            l = 1
        }
        ans += l
        ans %= mod
    }
    
    return ans
}
