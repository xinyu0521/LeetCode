//
//  1684. 统计一致字符串的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/11/8.
//

import Foundation

func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
    let allowed = Set(allowed)
    return words.reduce(into: 0) {
        for c in $1 {
            if !allowed.contains(c) { return }
        }
        $0 += 1
    }
}
