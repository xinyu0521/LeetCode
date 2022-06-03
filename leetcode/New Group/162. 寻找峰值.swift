//
//  162. 寻找峰值.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/30.
//

import Foundation

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = (left + right) >> 1
        if nums[mid] > nums[mid + 1] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return right
}
