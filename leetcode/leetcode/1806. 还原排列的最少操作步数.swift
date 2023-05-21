//
//  1806. 还原排列的最少操作步数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/9.
//

import Foundation

func reinitializePermutation(_ n: Int) -> Int {
    let perm = Array(0 ..< n)
    let n = perm.count
    
    var arr = Array(repeating: 0, count: n)
    for i in 0 ..< n {
        if i % 2 == 0 {
            arr[i] = perm[i / 2]
        } else {
            arr[i] = perm[n / 2 + (i - 1) / 2]
        }
    }
    
    var ans = 1
    
    while arr != perm {
        let tmp = arr
        for i in 0 ..< n {
            if i % 2 == 0 {
                arr[i] = tmp[i / 2]
            } else {
                arr[i] = tmp[n / 2 + (i - 1) / 2]
            }
        }
        ans += 1
    }
    
    return ans
}
