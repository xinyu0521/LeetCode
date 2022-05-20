//
//  436. 寻找右区间.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/20.
//

import Foundation

//[[1,4],[2,3],[3,4]]

func findRightInterval(_ intervals: [[Int]]) -> [Int] {
    var endIntervals: [[Int]] = []
    var startIntervals: [[Int]] = []
    
    for i in 0 ..< intervals.count {
        endIntervals.append([intervals[i][1], i])
        startIntervals.append([intervals[i][0], i])
    }
    
    endIntervals.sort { $0[0] < $1[0] }
    startIntervals.sort { $0[0] < $1[0] }

    var ans = Array(repeating: 0, count: intervals.count)
    var j = 0
    for range in endIntervals {
        while j < startIntervals.count, startIntervals[j][0] < range[0] {
            j += 1
        }
        
        if j < startIntervals.count {
            ans[range[1]] = startIntervals[j][1]
        } else {
            ans[range[1]] = -1
        }
    }
    
    return ans
}
