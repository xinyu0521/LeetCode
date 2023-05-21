//
//  136. 只出现一次的数字.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var single = 0
    for num in nums {
        single ^= num
    }
    return single
}
