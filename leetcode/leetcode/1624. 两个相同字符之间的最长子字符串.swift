//
//  1624. 两个相同字符之间的最长子字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/17.
//

import Foundation

func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
    let chars = Array(s)
    var res = -1
    chars.indices.reduce(into: Array(repeating: [], count: 26)) {
        $0[Int(chars[$1].asciiValue! - 97)].append($1)
    }.forEach { arr in
        if arr.count > 1 {
            let l = arr.last! - arr.first! - 1
            res = max(res, l)
        }
    }
    return res
}
