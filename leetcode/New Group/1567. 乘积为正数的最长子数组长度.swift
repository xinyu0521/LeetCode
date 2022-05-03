//
//  1567. 乘积为正数的最长子数组长度.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/11.
//

import Foundation

func getMaxLen(_ nums: [Int]) -> Int {
    var dp = Array(repeating: (plus: 0, minus: 0), count: nums.count)
    if nums[0] > 0 {
        dp[0] = (plus: 1, minus: 0)
    } else if nums[0] < 0 {
        dp[0] = (plus: 0, minus: 1)
    } else {
        dp[0] = (plus: 0, minus: 0)
    }
    
    var res = dp[0].plus
    
    for i in 1 ..< nums.count {
        let pre = dp[i - 1]
        let num = nums[i]
        
        if num > 0 {
            dp[i].plus = pre.plus + 1
            dp[i].minus = pre.minus == 0 ? 0 : pre.minus + 1
        } else if num < 0 {
            dp[i].plus = pre.minus == 0 ? 0 : pre.minus + 1
            dp[i].minus = pre.plus + 1
        } else {
            dp[i] = (plus: 0, minus: 0)
        }
        
        res = max(res, dp[i].plus)
    }

    return res
}
