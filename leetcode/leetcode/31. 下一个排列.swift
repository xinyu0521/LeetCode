//
//  31. 下一个排列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/3.
//

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    let n = nums.count
    var i = n - 2
    while i >= 0, nums[i] >= nums[i + 1] {
        i -= 1
    }
    
    if i < 0 {
        nums.reverse()
        return
    }
    
    var j = n - 1

    while j >= 0, nums[j] <= nums[i] {
        j -= 1
    }
    
    nums.swapAt(i, j)
    
    var left = i + 1
    var right = n - 1
    
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}
