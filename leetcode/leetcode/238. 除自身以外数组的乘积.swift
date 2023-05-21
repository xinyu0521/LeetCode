//
//  238. 除自身以外数组的乘积.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var left = Array(repeating: 0, count: n)
    var right = Array(repeating: 0, count: n)
    var ans: [Int] = []
    
    left[0] = 1
    for i in 1 ..< n {
        left[i] = nums[i - 1] * left[i - 1]
    }
    
    right[n - 1] = 1
    for i in (0 ..< n - 1).reversed() {
        right[i] = nums[i + 1] * right[i + 1]
    }
    
    for i in nums.indices {
        ans.append(right[i] * left[i])
    }
    
    return ans
}
