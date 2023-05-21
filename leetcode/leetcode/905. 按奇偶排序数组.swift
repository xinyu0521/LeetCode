//
//  905. 按奇偶排序数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/28.
//

import Foundation

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var nums = nums
    var i = 0
    var j = nums.count - 1
    
    while i < j {
        if nums[i] & 1 == 1, nums[j] & 1 == 0 {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
        
        if nums[i] & 1 == 0 {
            i += 1
        }
        
        if nums[j] & 1 == 1 {
            j -= 1
        }
    }
    
    return nums
}
