//
//  3.lengthOfLongestSubstring.swift
//  leetcode
//
//  Created by zhanx630 on 2022/3/31.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    if s.isEmpty {
        return 0
    }
    
    let chars = Array(s)
    var set: Set<Character> = []
    var start = 0
    var res = 0
    
    for end in 0 ..< chars.count {
        let char = chars[end]
        if set.contains(char) {
            while chars[start] != char {
                set.remove(chars[start])
                start += 1
            }
            start += 1
        } else {
            set.insert(char)
            res = max(res, end - start + 1)
        }
    }
    
    return res
}
