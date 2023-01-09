//
//  2180. 统计各位数字之和为偶数的整数个数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/6.
//

import Foundation

func countEven(_ num: Int) -> Int {
    (1 ... num).filter {
        var i = $0
        var sum = 0
        while i > 0 {
            sum += i % 10
            i = i / 10
        }
        return sum % 2 == 0
    }.count
}
