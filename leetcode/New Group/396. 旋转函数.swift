//
//  396. 旋转函数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/22.
//

import Foundation

func maxRotateFunction(_ nums: [Int]) -> Int {
    var numSum = 0
    var res = 0
    var f = 0
    for i in 0 ..< nums.count {
        f += i * nums[i]
        numSum += nums[i]
    }
    res = f
    
    for i in (1 ..< nums.count).reversed() {
        f += numSum - nums.count * nums[i]
        res = max(res, f)
    }

    return res
}
