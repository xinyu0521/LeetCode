//
//  821. 字符的最短距离.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/19.
//

import Foundation

func shortestToChar(_ s: String, _ c: Character) -> [Int] {
    let chars = [Character](s)
    var res = Array(repeating: chars.count, count: chars.count)
    
    var j = -1
    for i in 0 ..< chars.count {
        if chars[i] == c {
            j = i
        }
        
        if j == -1 { continue }
        
        res[i] = min(res[i], abs(i - j))
    }
    
    j = -1
    for i in (0 ..< chars.count).reversed() {
        if chars[i] == c {
            j = i
        }
        if j == -1 { continue }
        res[i] = min(res[i], abs(i - j))
    }
    
    return res
}
