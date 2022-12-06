//
//  1796. 字符串中第二大的数字.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/3.
//

import Foundation

func secondHighest(_ s: String) -> Int {
    var m = -1
    var n = -1
    for c in s where c.isNumber {
        let num = Int(c.asciiValue!) - 48
        if num > m {
            n = m
            m = num
        } else if num > n, num < m {
            n = num
        }
    }
    
    return n
}
