//
//  58. 最后一个单词的长度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/18.
//

import Foundation

func lengthOfLastWord(_ s: String) -> Int {
    let chars = Array(s)
    var l = 0
    for c in chars.reversed() {
        if l != 0, c == " " {
            break
        }
        if c != " " {
            l += 1
        }
    }
    
    return l
}
