//
//  915. 分割数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/24.
//

import Foundation

func partitionDisjoint(_ nums: [Int]) -> Int {
    var curMax = nums[0]
    var leftMax = nums[0]
    var pos = 0
    
    for i in 1 ..< nums.count - 1 {
        let num = nums[i]
        curMax = max(curMax, num)
        if num < leftMax {
            pos = i
            leftMax = curMax
        }
    }
    
    return pos + 1
}
