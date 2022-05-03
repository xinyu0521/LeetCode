//
//  344. 反转字符串.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/3.
//

import Foundation

func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    while left < right {
        s.swapAt(left, right)
        left += 1
        right -= 1
    }
}
