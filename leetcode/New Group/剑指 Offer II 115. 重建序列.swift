//
//  剑指 Offer II 115. 重建序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/23.
//

import Foundation

func sequenceReconstruction(_ nums: [Int], _ sequences: [[Int]]) -> Bool {
    var map: [Int: Set<Int>] = [:]
    for seq in sequences {
        for i in 0 ..< seq.count - 1 {
            if map[seq[i]] == nil {
                map[seq[i]] = Set<Int>()
            }
            map[seq[i]]?.insert(seq[i + 1])
        }
    }
    
    for i in 0 ..< nums.count - 1 {
        guard let set = map[nums[i]] else {
            return false
        }
        if !set.contains(nums[i + 1]) {
            return false
        }
    }
    
    return true
}
