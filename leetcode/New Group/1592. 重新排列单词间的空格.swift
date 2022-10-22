//
//  1592. 重新排列单词间的空格.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/7.
//

import Foundation

func reorderSpaces(_ text: String) -> String {
    let n = text.count
    let words = text.split(separator: " ")
    let m = words.reduce(into: 0) {
        $0 += $1.count
    }
    
    if words.count == 1 {
        return words[0] + String(repeating: " ", count: n - m)
    }
    
    let i = (n - m) / (words.count - 1)
    let j = (n - m) % (words.count - 1)
    
    return words.indices.reduce(into: "") {
        if $1 == words.count - 1 {
            $0 += words[$1] + String(repeating: " ", count: j)
        } else {
            $0 += words[$1] + String(repeating: " ", count: i)
        }
    }
}
