//
//  2185. 统计包含给定前缀的字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/8.
//

import Foundation

func prefixCount(_ words: [String], _ pref: String) -> Int {
    words.reduce(0) { $0 + ($1.hasPrefix(pref) ? 1 : 0) }
}
