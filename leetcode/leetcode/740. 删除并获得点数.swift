//
//  740. 删除并获得点数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/9.
//

import Foundation

func deleteAndEarn(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    var list = Array(repeating: 0, count: 10001)
    var maxNum = 0
    for num in nums {
        list[num] += num
        maxNum = max(maxNum, num)
    }
    
    var dp = Array(repeating: 0, count: maxNum + 1)
    dp[0] = list[0]
    dp[1] = max(list[0], list[1])
    for i in 2 ... maxNum {
        dp[i] = max(list[i] + dp[i - 2], dp[i - 1])
    }
    
    return dp[maxNum]
}
