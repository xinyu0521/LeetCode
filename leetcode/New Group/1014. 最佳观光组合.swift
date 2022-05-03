//
//  1014. 最佳观光组合.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/13.
//

import Foundation

func maxScoreSightseeingPair(_ values: [Int]) -> Int {
    var dp = Array(repeating: (maxVal: 0, maxSum: 0), count: values.count)
    dp[0] = (maxVal: values[0], maxSum: values[0])
    var res = dp[0].maxSum
    
    for i in 1 ..< values.count {
        let pre = dp[i - 1]
        dp[i].maxVal = max(values[i] + i, pre.maxVal)
        dp[i].maxSum = max(pre.maxSum, pre.maxVal + values[i] - i)
        res = max(res, dp[i].maxSum)
    }
    
    return res
}
