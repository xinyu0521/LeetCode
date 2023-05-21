//
//  134. 加油站.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var nums = zip(gas, cost).map { $0.1 - $0.0 }
    var start = 0
    var sum = 0
    var total = 0
    
    for i in nums.indices {
        sum += nums[i]
        total += nums[i]
        if sum < 0 {
            start = i + 1
            sum = 0
        }
    }
    
    return total < 0 ? -1 : start
}
