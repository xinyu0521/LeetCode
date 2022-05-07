//
//  442. 数组中重复的数据.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/8.
//

import Foundation

func findDuplicates(_ nums: [Int]) -> [Int] {
    var ans: [Int] = []
    var nums = nums
    
    for num in nums {
        let index = abs(num) - 1
        if nums[index] < 0 {
            ans.append(index + 1)
        } else {
            nums[index] = -nums[index]
        }
    }

    return ans
}
