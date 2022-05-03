//
//  217. 存在重复元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/1.
//

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>()
    for num in nums {
        if set.contains(num) { return true }
        set.insert(num)
    }
    return false
}
