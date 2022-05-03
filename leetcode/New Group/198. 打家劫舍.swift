//
//  198. 打家劫舍.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/7.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    var dp = Array(repeating: -1, count: nums.count + 1)
    
    func rob(_ n: Int) -> Int {
        if n < 0 {
            return 0
        }
        
        if dp[n] != -1 { return dp[n] }
        let res = max(nums[n] + rob(n - 2), rob(n - 1))
        dp[n] = res
        
        return res
    }
    
    return rob(nums.count - 1)
}
