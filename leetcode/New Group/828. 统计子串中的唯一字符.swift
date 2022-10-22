//
//  828. 统计子串中的唯一字符.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/6.
//

import Foundation

func uniqueLetterString(_ s: String) -> Int {
    let chars = Array(s)
    var index = chars.indices.reduce(into: [Character: [Int]]()) {
        let c = chars[$1]
        if !$0.keys.contains(c) {
            $0[c] = [-1]
        }
        $0[c]!.append($1)
    }
    
    var res = 0
    
    for key in index.keys {
        var arr = index[key]!
        arr.append(chars.count)
        for i in 1 ..< arr.count - 1 {
            res += (arr[i] - arr[i - 1]) * (arr[i + 1] - arr[i])
        }
    }
    
    return res
}
