//
//  944. 删列造序.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func minDeletionSize(_ strs: [String]) -> Int {
    var newStrs: [[Character]] = []
    for str in strs {
        newStrs.append(Array(str))
    }
    var ans = 0
    for i in 0 ..< newStrs[0].count {
        for j in 0 ..< newStrs.count - 1 {
            if newStrs[j][i] > newStrs[j + 1][i] {
                ans += 1
                break
            }
        }
    }
    
    return ans
}
