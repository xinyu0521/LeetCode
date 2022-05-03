//
//  35. 搜索插入位置.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count
    
    while left < right {
        let mid = (left + right) >> 1
        let val = nums[mid]
        
        if val > target {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
