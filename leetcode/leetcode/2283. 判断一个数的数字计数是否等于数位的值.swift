//
//  2283. 判断一个数的数字计数是否等于数位的值.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/11.
//

import Foundation

func digitCount(_ num: String) -> Bool {
    let nums = num.map { $0.wholeNumberValue! }
    return nums.reduce(into: Array(repeating: 0, count: num.count)) {
        if $1 < num.count { $0[$1] += 1 }
    } == nums
}
