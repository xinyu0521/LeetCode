//
//  56. 合并区间.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var res: [[Int]] = [intervals[0]]
    for interval in intervals.dropFirst() {
        if interval[0] > res.last![1] {
            res.append(interval)
        } else {
            res[res.count - 1][1] = max(res[res.count - 1][1], interval[1])
        }
    }
    
    return res
}
