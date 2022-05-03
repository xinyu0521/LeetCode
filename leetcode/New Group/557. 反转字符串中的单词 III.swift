//
//  557. 反转字符串中的单词 III.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/3.
//

import Foundation

func reverseWords(_ s: String) -> String {
    var ans = ""
    var word: [Character] = []
    
    for c in s {
        if c == " " {
            var i = 0
            var j = word.count - 1
            while i < j {
                word.swapAt(i, j)
                i += 1
                j -= 1
            }
            ans.append(contentsOf: word)
            ans.append(" ")
            word.removeAll()
        } else {
            word.append(c)
        }
    }
    
    if !word.isEmpty {
        var i = 0
        var j = word.count - 1
        while i < j {
            word.swapAt(i, j)
            i += 1
            j -= 1
        }
        ans.append(contentsOf: word)
    }
    
    return ans
}
