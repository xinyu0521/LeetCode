//
//  1704. 判断字符串的两半是否相似.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/11/11.
//

import Foundation

func halvesAreAlike(_ s: String) -> Bool {
    let set: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    let chars = Array(s)
    let n = chars.count
    var lc = 0
    var rc = 0
    for i in chars.indices where set.contains(chars[i]) {
        if i < n / 2 {
            lc += 1
        } else {
            rc += 1
        }
    }
    
    return lc == rc
}
