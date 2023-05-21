//
//  2293. 极大极小游戏.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/15.
//

import Foundation

func minMaxGame(_ nums: [Int]) -> Int {
    var nums = nums
    while nums.count > 1 {
        var new: [Int] = []
        for i in 0 ..< nums.count / 2 {
            if i % 2 == 0 {
                new.append(min(nums[2 * i], nums[2 * i + 1]))
            } else {
                new.append(max(nums[2 * i], nums[2 * i + 1]))
            }
        }
        nums = new
    }
    
    return nums[0]
}
