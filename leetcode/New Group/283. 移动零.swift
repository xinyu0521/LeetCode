//
//  283. 移动零.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/2.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    var left = 0
    var right = 0
    
    while right < count {
        if nums[right] != 0 {
            nums.swapAt(right, left)
            left += 1
        }
        right += 1
    }
}
