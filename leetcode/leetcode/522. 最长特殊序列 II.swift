//
//  522. 最长特殊序列 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/27.
//

import Foundation

func findLUSlength(_ strs: [String]) -> Int {
    var ans = -1
    let sortedStrs = strs.sorted { $0.count > $1.count }
    for (i, a) in sortedStrs.enumerated() {
        var isSub = false
        for (j, b) in sortedStrs.enumerated() {
            if i == j { continue }
            if a.count > b.count { break }
            
            let acs = Array(a)
            let bcs = Array(b)
            var m = 0
            var n = 0
            
            while m < acs.count, n < bcs.count {
                if acs[m] != bcs[n] {
                    n += 1
                    continue
                }
                m += 1
                n += 1
            }
            
            if m == acs.count {
                isSub = true
            }
        }
        
        if !isSub {
            ans = max(ans, a.count)
        }
    }
    
    return ans
}
