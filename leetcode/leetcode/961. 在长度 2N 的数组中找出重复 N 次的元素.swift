//
//  961. 在长度 2N 的数组中找出重复 N 次的元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/21.
//

import Foundation

func repeatedNTimes(_ nums: [Int]) -> Int {
    var set: Set<Int> = []
    for num in nums {
        if set.contains(num) {
            return num
        } else {
            set.insert(num)
        }
    }
    
    return -1
}
