//
//  1750. 删除字符串两端相同字符后的最短长度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/28.
//

import Foundation

func minimumLength(_ s: String) -> Int {
    let s = Array(s)
    let n = s.count
    var l = 0
    var r = n - 1
    
    while l < r, s[l] == s[r] {
        while l < r, s[l] == s[l + 1] {
            l += 1
        }
        
        while l < r, s[r] == s[r - 1] {
            r -= 1
        }
        
        l += 1
        r -= 1
    }
    
    return l > r ? 0 : r - l + 1
}
