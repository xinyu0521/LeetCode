//
//  1089. 复写零.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/17.
//

import Foundation

func duplicateZeros(_ arr: inout [Int]) {
    var cnt = arr.reduce(into: 0) {$0 += $1 == 0 ? 1 : 0}
    var m = arr.count - 1
    var n = arr.count - 1
    while cnt > 0 {
        if arr[m] == 0 {
            cnt -= 2
        } else {
            cnt -= 1
        }
        m -= 1
    }
    
    if cnt == -1 {
        arr[n] = arr[m]
        n -= 1
    }
    
    while m >= 0 {
        if arr[m] == 0 {
            arr[n] = 0
            arr[n - 1] = 0
            n -= 2
        } else {
            arr[n] = arr[m]
            n -= 1
        }
        m -= 1
    }
}
