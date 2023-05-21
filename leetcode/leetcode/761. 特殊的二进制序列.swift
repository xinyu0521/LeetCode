//
//  761. 特殊的二进制序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/8.
//

import Foundation

func makeLargestSpecial(_ s: String) -> String {
    if s.isEmpty { return "" }
    var count = 0
    var last = 0
    let chars = Array(s)
    var strs: [String] = []
    for (i, c) in chars.enumerated() {
        if c == "1" {
            count += 1
        } else {
            count -= 1
        }
        
        if count == 0 {
            let s = "1\(makeLargestSpecial(String(chars[last + 1 ..< i])))0"
            strs.append(s)
            last = i + 1
        }
    }
    return strs.sorted(by: >).reduce(into: "") { $0 += $1 }
}
