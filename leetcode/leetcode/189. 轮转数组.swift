//
//  189. 轮转数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/1.
//

import Foundation

func rotate(_ nums: inout [Int], _ k: Int) {
    let count = nums.count
    let m = k % count
    nums += nums
    nums = Array(nums[(count - m) ..< (count * 2 - m)])
}
