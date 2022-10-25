//
//  1768. 交替合并字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    let chars1 = Array(word1)
    let chars2 = Array(word2)
    
    var i = 0
    var j = 0
    
    var res = ""
    
    while i < chars1.count || j < chars2.count {
        if i < chars1.count {
            res.append(chars1[i])
            i += 1
        }
        
        if j < chars2.count {
            res.append(chars2[j])
            j += 1
        }
    }
    
    return res
}
