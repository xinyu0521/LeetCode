//
//  198. 打家劫舍.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/7.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    var dp = Array(repeating: (r: 0, n: 0), count: nums.count)
    dp[0] = (nums[0], 0)
    for i in 1 ..< nums.count {
        dp[i].r = nums[i] + dp[i - 1].n
        dp[i].n = max(dp[i - 1].r, dp[i - 1].n)
    }

    return max(dp.last!.r, dp.last!.n)
}
