//
//  15. 三数之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/2.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    if nums.isEmpty || nums.count < 3 {
        return []
    }
    
    var nums = nums
    nums.sort()
    
    if nums[0] > 0 {
        return []
    }
    
    var res: [[Int]] = []
    
    for i in 0 ..< nums.count {
        if i > 0, nums[i] == nums[i - 1] { continue }
        
        var start = i + 1
        var end = nums.count - 1
        
        while start < end {
            let sum = nums[i] + nums[start] + nums[end]
            if sum == 0 {
                res.append([nums[i], nums[start], nums[end]])
                start += 1
                end -= 1
                while start < end, nums[start] == nums[start - 1] {
                    start += 1
                }
                
                while start < end, nums[end] == nums[end + 1] {
                    end -= 1
                }
            } else if sum > 0 {
                end -= 1
            } else {
                start += 1
            }
        }
    }
    
    return res
}
