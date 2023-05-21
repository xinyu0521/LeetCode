//
//  2042. 检查句子中的数字是否递增.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/3.
//

import Foundation

func areNumbersAscending(_ s: String) -> Bool {
    let nums = s.split(separator: " ").compactMap { Int($0) }
    
    for i in 1 ..< nums.count where nums[i] <= nums[i - 1] {
        return false
    }
    
    return true
}
