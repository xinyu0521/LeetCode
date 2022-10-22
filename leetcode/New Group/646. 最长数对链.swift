//
//  646. 最长数对链.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/3.
//

import Foundation

func findLongestChain(_ pairs: [[Int]]) -> Int {
    var last = Int.min
    return pairs
        .sorted { $0[1] < $1[1] }
        .reduce(0) {
            if $1[0] > last {
                last = $1[1]
                return $0 + 1
            }
            return $0
        }
}
