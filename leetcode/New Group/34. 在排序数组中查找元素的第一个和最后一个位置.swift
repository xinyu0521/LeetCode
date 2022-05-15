//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/15.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var i = 0
    var j = 0
    
    var begin = 0
    var end = nums.count
    
    while begin < end {
        let mid = (begin + end) >> 1
        let val = nums[mid]
        if target <= val {
            end = mid
        } else {
            begin = mid + 1
        }
    }
    
    i = begin
    
    begin = 0
    end = nums.count
    
    while begin < end {
        let mid = (begin + end) >> 1
        let val = nums[mid]
        if target >= val {
            begin = mid + 1
        } else {
            end = mid
        }
    }
    
    j = begin - 1
    
    if (0 ..< nums.count).contains(i), (0 ..< nums.count).contains(j), nums[i] == nums[j], nums[i] == target {
        return [i, j]
    }
    
    return [-1, -1]
}
