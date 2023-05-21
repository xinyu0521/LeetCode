//
//  668. 乘法表中第k小的数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/18.
//

import Foundation

func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
    var left = 1
    var right = m * n
    
    while left < right {
        let x = left + (right - left) / 2
        var cnt = 0
        for i in 1 ... m {
            let k = x / i
            if k > n {
                cnt += n
            } else {
                cnt += k
            }
        }
        
        if cnt >= k {
            right = x
        } else {
            left = x + 1
        }
    }
    
    return left
}
