//
//  1464. 数组中两元素的最大乘积.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/26.
//

import Foundation

func maxProduct2(_ nums: [Int]) -> Int {
    var m = 0
    var n = 0
    for num in nums {
        if num > m {
            n = m
            m = num
        } else if num > n {
            n = num
        }
    }
    return (m - 1) * (n - 1)
}
