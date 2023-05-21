//
//  55. 跳跃游戏.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    var i = 0
    var l = nums[0]
    
    while i <= l, l < nums.count - 1 {
        l = max(l, i + nums[i])
        i += 1
    }
    
    return l >= nums.count - 1
}
