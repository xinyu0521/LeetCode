//
//  1805. 字符串中不同整数的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/6.
//

import Foundation

func numDifferentIntegers(_ word: String) -> Int {
    let chars = Array(word)
    var res: Set<String> = []
    var str = ""
    
    for c in chars {
        if c.isNumber {
            str.append(c)
        } else {
            if str != "" {
                res.insert(removeZero(str))
            }
            str = ""
        }
    }
    
    if str != "" {
        res.insert(removeZero(str))
    }
    
    return res.count
    
    func removeZero(_ str: String) -> String {
        var i = 0
        while i < str.count, str[str.index(str.startIndex, offsetBy: i)] == "0" {
            i += 1
        }
        
        if i == str.count {
            return "0"
        } else {
            return String(str.suffix(from: str.index(str.startIndex, offsetBy: i)))
        }
    }
}
