//
//  796. 旋转字符串.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/7.
//

import Foundation

func rotateString(_ s: String, _ goal: String) -> Bool {
    return s.count == goal.count && (s + s).contains(goal)
}
