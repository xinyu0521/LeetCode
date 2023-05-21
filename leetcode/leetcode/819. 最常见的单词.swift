//
//  819. 最常见的单词.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/17.
//

import Foundation

func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
    let sep = Set<Character>([" ", ",", ".", "'", "!", "?", ";"])
    let banSet = Set(banned)
    var countMap: [String: Int] = [:]
    var res = ""
    var word = ""
    
    for char in paragraph {
        if sep.contains(char) {
            word = word.lowercased()
            if banSet.contains(word) || word.isEmpty {
                word = ""
                continue
            }
            let count = (countMap[word] ?? 0) + 1
            countMap[word] = count
            res = (countMap[res] ?? 0) > count ? res : word
            word = ""
            continue
        }
        
        word.append(char)
    }
    
    word = word.lowercased()
    if !word.isEmpty, !banSet.contains(word) {
        let count = (countMap[word] ?? 0) + 1
        res = (countMap[res] ?? 0) > count ? res : word
    }
    
    return res
}
