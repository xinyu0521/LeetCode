//
//  1408. 数组中的字符串匹配.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/6.
//

import Foundation

func stringMatching(_ words: [String]) -> [String] {
    return words.filter { w in
        for word in words where word.contains(w) && word != w {
            return true
        }
        return false
    }
}
