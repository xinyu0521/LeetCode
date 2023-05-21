//
//  1217. 玩筹码.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/8.
//

import Foundation

func minCostToMoveChips(_ position: [Int]) -> Int {
    var odd = 0
    var even = 0
    
    for pos in position {
        if pos % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
    }
    
    return min(even, odd)
}
