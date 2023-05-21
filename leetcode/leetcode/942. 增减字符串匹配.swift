//
//  942. 增减字符串匹配.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/9.
//

import Foundation

func diStringMatch(_ s: String) -> [Int] {
    var n = s.count
    var m = 0
    var ans: [Int] = []
    
    for c in s {
        if c == "I" {
            ans.append(m)
            m += 1
        } else {
            ans.append(n)
            n -= 1
        }
    }
    
    ans.append(m)
    
    return ans
}
