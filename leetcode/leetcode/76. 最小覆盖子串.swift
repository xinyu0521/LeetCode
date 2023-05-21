//
//  76. 最小覆盖子串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    let chars = Array(s)
    let n = chars.count
    let ts = Array(t)
    
    var need = ts.reduce(into: [Character: Int]()) {
        $0[$1, default: 0] += 1
    }
    
    var needCount = ts.count
    
    var i = 0
    var j = 0
    var ans = (0, Int.max)
    
    while j < n {
        let c = chars[j]
        
        if need[c, default: 0] > 0 {
            needCount -= 1
        }
        need[c, default: 0] -= 1
        
        while needCount == 0 {
            if (j - i) < ans.1 - ans.0 {
                ans = (i, j)
            }
            
            let lc = chars[i]
            
            if need[lc, default: 0] == 0 {
                needCount += 1
            }
            
            need[lc, default: 0] += 1
            i += 1
        }
        
        j += 1
    } 
    
    return ans.1 == Int.max ? "" : String(chars[ans.0...ans.1])
}
