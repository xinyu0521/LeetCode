//
//  1403. 非递增顺序的最小子序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/4.
//

import Foundation

func minSubsequence(_ nums: [Int]) -> [Int] {
    let sum = nums.reduce(0, +)
    let nums = nums.sorted(by: >)
    var res: [Int] = []
    var cur = 0
    for num in nums where cur <= sum - cur {
        cur += num
        res.append(num)
    }
    return res
}
