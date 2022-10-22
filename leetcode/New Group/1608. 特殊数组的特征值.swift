//
//  1608. 特殊数组的特征值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/12.
//

import Foundation

func specialArray(_ nums: [Int]) -> Int {
    let nums = nums.sorted(by: >)
    for i in 1 ... nums.count {
        if nums[i - 1] >= i && (i == nums.count || nums[i] < i) {
            return i;
        }
    }
    return -1
}
