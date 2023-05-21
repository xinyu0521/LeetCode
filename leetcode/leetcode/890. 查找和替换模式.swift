//
//  890. 查找和替换模式.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/12.
//

import Foundation

func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    var ans: [String] = []
    all: for word in words where word.count == pattern.count {
        var map: [Character: Character] = [:]
        var set: Set<Character> = [] 
        for i in word.indices {
            let c1 = word[i]
            let c2 = pattern[i]
            if let c = map[c2] {
                if c != c1 {
                    continue all
                }
                continue
            }
            if set.contains(c1) {
                continue all
            }
            set.insert(c1)
            map[c2] = c1
        }
        ans.append(word)
    }
    return ans
}
