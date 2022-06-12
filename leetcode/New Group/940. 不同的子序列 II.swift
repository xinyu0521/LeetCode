//
//  940. 不同的子序列 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/10.
//

import Foundation

func distinctSubseqII(_ s: String) -> Int {
    var ans = 0
    var end = Array(repeating: 0, count: 26)
    let mod = 1000000007
    
    for c in Array(s) {
        let i = Int(c.asciiValue! - Character("a").asciiValue!)
        let added = ans - end[i] + 1
        ans = (ans + added) % mod
        end[i] += added
    }
    
    return ans % mod
}
