//
//  806. 写字符串需要的行数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/12.
//

import Foundation

func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
    var sum = 0
    var line = 1
    for char in s {
        let width = widths[Int(char.asciiValue!) - 97]
        if width > 100 - sum {
            line += 1
            sum = width
        }
        sum += width
    }
    
    return [line, sum]
}
