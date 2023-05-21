//
//  1636. 按照频率将数组升序排序.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/19.
//

import Foundation

func frequencySort(_ nums: [Int]) -> [Int] {
    let cnt = nums.reduce(into: [Int: Int]()) {
        $0[$1] = ($0[$1] ?? 0) + 1
    }
    return nums.sorted {
        if cnt[$0] == cnt[$1] {
            return $0 > $1
        }
        return cnt[$0]! < cnt[$1]!
    }
}
