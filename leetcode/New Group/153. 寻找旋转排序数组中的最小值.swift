//
//  153. 寻找旋转排序数组中的最小值.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/29.
//

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        if nums[mid] < nums[right] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return nums[left]
}
