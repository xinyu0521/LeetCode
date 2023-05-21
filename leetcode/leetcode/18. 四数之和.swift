//
//  18. 四数之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/3.
//

import Foundation

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.isEmpty || nums.count < 4 {
        return []
    }
    
    var nums = nums
    nums.sort()
    
    var res: [[Int]] = []
    
    for i in 0 ..< nums.count {
        if i > 0, nums[i] == nums[i - 1] { continue }
        
        for j in i + 1 ..< nums.count {
            if j > i + 1, nums[j] == nums[j - 1] { continue }
            
            var start = j + 1
            var end = nums.count - 1
            
            while start < end {
                let sum = nums[i] + nums[j] + nums[start] + nums[end]
                if sum == target {
                    res.append([nums[i], nums[j], nums[start], nums[end]])
                    start += 1
                    end -= 1
                    while start < end, nums[start] == nums[start - 1] {
                        start += 1
                    }
                    
                    while start < end, nums[end] == nums[end + 1] {
                        end -= 1
                    }
                } else if sum > target {
                    end -= 1
                } else {
                    start += 1
                }
            }
        }
    }
    
    return res
}
