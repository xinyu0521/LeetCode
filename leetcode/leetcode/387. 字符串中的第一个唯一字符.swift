//
//  387. 字符串中的第一个唯一字符.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/6.
//

import Foundation

func firstUniqChar(_ s: String) -> Int {
    let chars = Array(s)
    var cnt: [Character: Int] = [:]
    for char in chars {
        cnt[char] = (cnt[char] ?? 0) + 1
    }
    
    for i in 0 ..< chars.count where cnt[chars[i]] == 1 {
        return i
    }
    
    return -1
}
