//
//  823. 带因子的二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
    let nums = arr.sorted()
    var dp: [Int: Int] = [:]
    let kMode = 1000000007

    for i in 0 ..< nums.count {
        dp[nums[i]] = 1
        for j in 0 ..< i where nums[i] % nums[j] == 0 && dp[nums[i] / nums[j]] != nil {
            dp[nums[i]]! += (dp[nums[j]]! * dp[nums[i] / nums[j]]!) % kMode
        }
    }
    
    var ans = 0
    
    for (_, val) in dp {
        ans += val
    }

    return ans
}
