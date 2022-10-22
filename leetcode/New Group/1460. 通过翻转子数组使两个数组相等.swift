//
//  1460. 通过翻转子数组使两个数组相等.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/24.
//

import Foundation

func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
    !zip(target, arr)
        .reduce(into: Array(repeating: 0, count: 1001)) {
            $0[$1.0] += 1
            $0[$1.1] -= 1
        }
        .contains { $0 != 0 }
}
