//
//  455. 分发饼干.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/8.
//

import Foundation

func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let s = s.sorted(by: >)
    let g = g.sorted(by: >)
    
    var ans = 0
    var m = 0
    var n = 0
    
    while n < g.count, m < s.count {
        if g[n] <= s[m] {
            ans += 1
            m += 1
        }
        n += 1
    }
    
    return ans
}
