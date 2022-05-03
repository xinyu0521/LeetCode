//
//  704. 二分查找.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count
    
    while left < right {
        let mid = (left + right) >> 1
        let val = nums[mid]
        
        if val > target {
            right = mid
        } else if val < target {
            left = mid + 1
        } else {
            return mid
        }
    }
    
    return -1
}
