//
//  918. 环形子数组的最大和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func maxSubarraySumCircular(_ nums: [Int]) -> Int {
    var list: [Int] = []
    list.append(contentsOf: nums)
    list.append(contentsOf: nums)

    var dp = Array(repeating: 0, count: list.count)
    dp[0] = nums[0]
    for i in 1 ..< list.count {
        let preSum = dp[i - 1]
        if preSum > 0 {
            dp[i] = list[i] + preSum
            if i >= list.count >> 1, dp[i - list.count >> 1] > 0 {
                dp[i] -= dp[i - list.count >> 1]
            }
        } else {
            dp[i] = list[i]
        }
    }

    return dp.max()!
}
