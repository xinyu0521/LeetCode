//
//  167. 两数之和 II - 输入有序数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/2.
//

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum > target {
            right -= 1
        } else if sum < target {
            left += 1
        } else {
            return [left + 1, right + 1]
        }
    }
    
    return []
}
