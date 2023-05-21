//
//  242. 有效的字母异位词.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/6.
//

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count { return false }
    
    var cnt: [Int] = Array(repeating: 0, count: 26)
    
    for c in s {
        cnt[Int(c.asciiValue!) - 97] += 1
    }
    
    for c in t {
        cnt[Int(c.asciiValue!) - 97] -= 1
    }
    
    for i in cnt where i != 0 {
        return false
    }
    
    return true
}
