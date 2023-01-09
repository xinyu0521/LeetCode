//
//  1802. 有界数组中指定下标处的最大值.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/4.
//

import Foundation

func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
    var left = 1
    var right = maxSum
    
    while left < right {
        let mid = (right + left + 1) / 2
        if valid(mid) {
            left = mid
        } else {
            right = mid - 1
        }
    }
    
    return left
    
    func valid(_ mid: Int) -> Bool {
        let left = index
        let right = n - index - 1
        return mid + cal(mid, left) + cal(mid, right) <= maxSum
    }
    
    func cal(_ big: Int, _ length: Int) -> Int {
        if length + 1 < big {
            let small = big - length
            return (big - 1 + small) * length / 2
        } else {
            let ones = length - (big - 1)
            return big * (big - 1) / 2 + ones
        }
    }
}
