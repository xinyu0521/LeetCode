//
//  1764. 通过连接另一个数组的子数组得到一个数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/17.
//

import Foundation

func canChoose(_ groups: [[Int]], _ nums: [Int]) -> Bool {
    var left = 0
    var count = 0
    
    for group in groups {
        while left + group.count <= nums.count {
            if Array(nums[left ..< left + group.count]) == group {
                left += group.count
                count += 1
                break
            }
            left += 1
        }
    }
    
    return count == groups.count
}
