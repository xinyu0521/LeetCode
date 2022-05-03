//
//  213. 打家劫舍 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/8.
//

import Foundation

func rob2(_ nums: [Int]) -> Int {
    
    if nums.count == 1 {
        return nums[0]
    }
    
    var dp1 = Array(repeating: -1, count: nums.count + 1)
    var dp2 = Array(repeating: -1, count: nums.count + 1)
    
    func rob(_ i: Int, _ j: Int) -> Int {
        if j < i {
            return 0
        }
        
        var res: Int
        
        if i == 0 {
            if dp1[j] != -1 { return dp1[j] }
            res = max(nums[j] + rob(i, j - 2), rob(i, j - 1))
            dp1[j] = res
        } else {
            if dp2[j] != -1 { return dp2[j] }
            res = max(nums[j] + rob(i, j - 2), rob(i, j - 1))
            dp2[j] = res
        }
        
        return res
    }
    
    return max(rob(0, nums.count - 2),
               rob(1, nums.count - 1))
               
}
