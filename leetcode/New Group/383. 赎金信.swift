//
//  383. 赎金信.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/6.
//

import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var cnt: [Int] = Array(repeating: 0, count: 26)
    
    for c in magazine {
        cnt[Int(c.asciiValue!) - 97] += 1
    }
    
    for c in ransomNote {
        let i = Int(c.asciiValue!) - 97
        cnt[i] -= 1
        if cnt[i] < 0 {
            return false
        }
    }
    
    return true
}
