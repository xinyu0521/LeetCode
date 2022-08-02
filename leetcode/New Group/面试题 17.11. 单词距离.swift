//
//  面试题 17.11. 单词距离.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/27.
//

import Foundation

func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
    var m = -1
    var n = -1
    var ans = Int.max
    
    for i in 0 ..< words.count {
        if words[i] == word1 {
            m = i
        } else if words[i] == word2 {
            n = i
        }
        
        if m != -1, n != -1 {
            ans = min(ans, abs(m - n))
        }
    }
    
    print("2")

    return ans
}
