//
//  435. 无重叠区间.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var end = intervals[0][1]
    var ans = 0
    
    for interval in intervals.dropFirst() {
        if interval[0] >= end {
            end = interval[1]
        } else {
            end = min(end, interval[1])
            ans += 1
        }
    }
    
    return ans
}
