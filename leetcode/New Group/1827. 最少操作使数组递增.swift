//
//  1827. 最少操作使数组递增.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/11.
//

import Foundation

func minOperations(_ nums: [Int]) -> Int {
    var nums = nums
    var ans = 0
    
    for i in nums.indices.dropFirst() where nums[i] <= nums[i - 1] {
        ans += nums[i - 1] - nums[i] + 1
        nums[i] = nums[i - 1] + 1
    }
    
    return ans
}
