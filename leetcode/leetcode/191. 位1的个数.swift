//
//  191. 位1的个数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func hammingWeight(_ n: Int) -> Int {
    var cnt = 0
    var n = n
    while n > 0 {
        n = n - (n & -n)
        cnt += 1
    }
    
    return cnt
}
