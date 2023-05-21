//
//  560. 和为 K 的子数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var map: [Int: Int] = [:]
    map[0] = 1
    var preSum = 0
    var count = 0
    for num in nums {
        preSum += num
        count += map[preSum - k, default: 0]
        map[preSum, default: 0] += 1
    }
    return count
}
