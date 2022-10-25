//
//  287. 寻找重复数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func findDuplicate(_ nums: [Int]) -> Int {
    var slow = nums[0]
    var fast = nums[nums[0]]
    
    while slow != fast {
        slow = nums[slow]
        fast = nums[nums[fast]]
    }
    
    slow = 0
    
    while slow != fast {
        slow = nums[slow]
        fast = nums[fast]
    }
    
    return slow
    
}
