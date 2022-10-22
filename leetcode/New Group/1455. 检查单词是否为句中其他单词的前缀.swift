//
//  1455. 检查单词是否为句中其他单词的前缀.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/21.
//

import Foundation

func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
    let i = sentence.split(separator: " ").firstIndex { String($0).hasPrefix(searchWord) } ?? -1
    return i == -1 ? i : i + 1
}
