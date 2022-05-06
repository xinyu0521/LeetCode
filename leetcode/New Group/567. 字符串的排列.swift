//
//  567. 字符串的排列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/5.
//

import Foundation

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s2.count < s1.count {
        return false
    }
    
    let chars1 = Array(s1)
    let chars2 = Array(s2)
    
    var cnt1 = Array(repeating: 0, count: 26)
    var cnt2 = Array(repeating: 0, count: 26)
    
    for i in 0 ..< chars1.count {
        cnt1[Int(chars1[i].asciiValue!) - 97] += 1
        cnt2[Int(chars2[i].asciiValue!) - 97] += 1
    }
    
    if cnt1 == cnt2 {
        return true
    }
    
    for i in chars1.count ..< chars2.count {
        cnt2[Int(chars2[i - chars1.count].asciiValue!) - 97] -= 1
        cnt2[Int(chars2[i].asciiValue!) - 97] += 1
        
        if cnt1 == cnt2 {
            return true
        }
    }
    
    return false
}
