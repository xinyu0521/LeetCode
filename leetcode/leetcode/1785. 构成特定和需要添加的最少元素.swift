//
//  1785. 构成特定和需要添加的最少元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/16.
//

import Foundation

func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
    (abs(nums.reduce(0, +) - goal) + limit - 1) / limit
}
