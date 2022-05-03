//
//  16. 最接近的三数之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/3.
//

import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
   
    let nums = nums.sorted()
    var res = nums[0] + nums[1] + nums[2]
    
    for i in 0 ..< nums.count {
        if i > 0, nums[i] == nums[i - 1] { continue }
        
        var start = i + 1
        var end = nums.count - 1
        
        while start < end {
            let sum = nums[i] + nums[start] + nums[end]
            res = abs(sum - target) < abs(res - target) ? sum : res
            if sum == target {
                return target
            } else if sum > target {
                end -= 1
            } else {
                start += 1
            }
        }
    }
    
    return res
}
