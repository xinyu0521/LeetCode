//
//  53. 最大子数组和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var dp = 0
    var ans = nums[0]
    
    for num in nums {
        dp = max(dp + num, num)
        ans = max(ans, num)
    }
    
    return ans
}
