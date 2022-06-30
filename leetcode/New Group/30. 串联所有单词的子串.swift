//
//  30. 串联所有单词的子串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/23.
//

import Foundation

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    let len = words[0].count
    let wordCount = words.count
    let totalL = len * words.count
    if totalL > s.count { return [] }
    
    var ans: [Int] = []
    let chars = Array(s)
    var map: [String: Int] = [:]
    for word in words {
        map[word] = (map[word] ?? 0) + 1
    }
    
    for i in 0 ..< len {
        var differ = map
        var j = 0
        while true {
            let m = i + j * len
            let n = m + len
            if n > s.count { break }
            
            let start = String(chars[m ..< n])
            differ[start] = (differ[start] ?? 0) - 1
            if differ[start] == 0 {
                differ.removeValue(forKey: start)
            }
            
            if j >= wordCount {
                
                let p = i + (j - wordCount) * len
                let q = p + len
                let end = String(chars[p ..< q])
                differ[end] = (differ[end] ?? 0) + 1
                if differ[end] == 0 {
                    differ.removeValue(forKey: end)
                }
            }
            
            j += 1
            
            if j < wordCount {
                continue
            }
            
            if differ.isEmpty {
                ans.append(i + (j - wordCount) * len)
            }
        }
    }
    
    return ans
}
