//
//  2351. 第一个出现两次的字母.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/1.
//

import Foundation

func repeatedCharacter(_ s: String) -> Character {
    var set: Set<Character> = []
    for c in s {
        if set.contains(c) {
            return c
        }
        set.insert(c)
    }
    return "c"
}
