//
//  2341. 数组能形成多少数对.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/16.
//

import Foundation

func numberOfPairs(_ nums: [Int]) -> [Int] {
    var pairs = 0
    var set: Set<Int> = []
    
    for num in nums {
        if set.contains(num) {
            pairs += 1
            set.remove(num)
        } else {
            set.insert(num)
        }
    }
    
    return [pairs, nums.count - pairs * 2]
}
