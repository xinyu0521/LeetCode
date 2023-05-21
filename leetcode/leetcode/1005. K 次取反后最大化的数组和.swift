//
//  1005. K 次取反后最大化的数组和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted { abs($0) > abs($1) }
    var k = k
    for i in nums.indices {
        if nums[i] < 0, k > 0 {
            nums[i] = -nums[i]
            k -= 1
        }
    }
    
    var sum = nums.reduce(0, +)
    if k > 0, k % 2 == 1 {
        sum -= nums.last! * 2
    }
    
    return sum
}
