//
//  75. 颜色分类.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func sortColors(_ nums: inout [Int]) {
    var m = 0
    for i in nums.indices where nums[i] == 0 {
            nums.swapAt(i, m)
            m += 1
    }
    m = nums.count - 1
    for i in nums.indices.reversed() where nums[i] == 2 {
        nums.swapAt(i, m)
        m -= 1
    }
}
