//
//  56. 合并区间.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var begin = intervals[0][0]
    var end = intervals[0][1]
    var res: [[Int]] = []
    for interval in intervals {
        if interval[0] > end {
            res.append([begin, end])
            begin = interval[0]
            end = interval[1]
        } else {
            end = max(end, interval[1])
        }
    }
    
    res.append([begin, end])
    
    return res
}
