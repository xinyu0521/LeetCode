//
//  152. 乘积最大子数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/11.
//

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    var dp = Array(repeating: (max: 0, min: 0), count: nums.count)
    var res = nums[0]
    dp[0] = (max: res, min: res)
    
    for i in 1 ..< nums.count {
        let num = nums[i]
        var pre = dp[i - 1]
        if num < 0 {
            pre = (max: pre.min, min: pre.max)
        }
        dp[i] = (max: max(pre.max * num, num), min: min(pre.min * num, num))
        res = max(res, dp[i].max)
    }
    
    return res
}
