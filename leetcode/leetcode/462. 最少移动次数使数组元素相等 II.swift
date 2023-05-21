//
//  462. 最少移动次数使数组元素相等 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/19.
//

import Foundation

func minMoves2(_ nums: [Int]) -> Int {
    var ans = 0
    let newNums = nums.sorted()
    let mid = newNums.count / 2
    let target = newNums[mid]
    for num in newNums {
        ans += abs(num - target)
    }
    return ans
}
