//
//  1. 两数之和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/2.
//

import Foundation

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0 ..< nums.count {
        let dif = target - nums[i]
        if map[dif] == nil {
            map[nums[i]] = i
        } else {
            return [i, map[dif]!]
        }
    }
    
    return []
}
