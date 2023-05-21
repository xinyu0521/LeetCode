//
//  33. 搜索旋转排序数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/26.
//

import Foundation

func search2(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty { return -1 }
    if nums.count == 1 { return nums[0] == target ? 0 : -1 }
    
    var left = 0
    var right = nums.count
    
    while left < right {
        let mid = left + (right - left) / 2
        if target == nums[mid] {
            return mid
        }
        
        if nums[left] < nums[mid] {
            if (nums[left] ... nums[mid]).contains(target)  {
                right = mid
            } else {
                left = mid + 1
            }
        } else {
            if (nums[mid] ... nums[right - 1]).contains(target) {
                left = mid + 1
            } else {
                right = mid
            }
        }
    }
    
    return -1
}
