//
//  278. 第一个错误的版本.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func firstBadVersion(_ n: Int) -> Int {
    var left = 1
    var right = n
    
    while left < right {
        let mid = (left + right) >> 1
        let isBad = isBadVersion(mid)
        
        if isBad {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}

func isBadVersion(_ version: Int) -> Bool {
    return true
}
