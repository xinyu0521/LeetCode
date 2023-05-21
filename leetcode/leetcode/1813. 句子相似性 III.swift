//
//  1813. 句子相似性 III.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/17.
//

import Foundation

func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
    let words1 = sentence1.split(separator: " ")
    let words2 = sentence2.split(separator: " ")
    
    var i = 0
    var j = 0
    
    while i < words1.count,
          i < words2.count,
          words1[i] == words2[i] {
        i += 1
    }
    
    while j < words1.count - i,
          j < words2.count - i,
          words1[words1.count - 1 - j] == words2[words2.count - 1 - j] {
        j += 1
    }
    
    return i + j == min(words1.count, words2.count)
}
