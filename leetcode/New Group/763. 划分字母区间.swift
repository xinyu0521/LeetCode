//
//  763. 划分字母区间.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    var map: [Character: Int] = [:]
    let chars = Array(s)
    for i in chars.indices {
        let c = chars[i]
        map[c] = i
    }
    
    var ans: [Int] = []
    var last = map[chars[0], default: 0]
    for i in chars.indices {
        if last == i {
            ans.append(i - ans.reduce(0, +) + 1)
        } else {
            last = max(last, map[chars[i], default: 0])
        }
    }
    
    return ans
}
