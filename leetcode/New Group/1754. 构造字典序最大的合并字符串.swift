//
//  1754. 构造字典序最大的合并字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/24.
//

import Foundation

func largestMerge(_ word1: String, _ word2: String) -> String {
    
    var i = word1.startIndex
    var j = word2.startIndex
    var m = word1.endIndex
    var n = word2.endIndex
    
    var ans = ""
    
    while i < word1.endIndex || j < word2.endIndex {
        if i < word1.endIndex,
           word1[i ..< m] > word2[j ..< n] {
            ans.append(word1[i])
            i = word1.index(after: i)
        } else {
            ans.append(word2[j])
            j = word2.index(after: j)
        }
    }
    
    return ans
}
