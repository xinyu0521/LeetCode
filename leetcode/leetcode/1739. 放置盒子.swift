//
//  1739. 放置盒子.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/25.
//

import Foundation

func minimumBoxes(_ n: Int) -> Int {
    var ans = 0
    var sum = 0
    var i = 1
    var j = 1
    
    while ans + sum + i <= n {
        ans += i
        sum += ans
        i += 1
    }
    
    while sum < n {
        ans += 1
        sum += j
        j += 1
    }
    
    return ans
}
