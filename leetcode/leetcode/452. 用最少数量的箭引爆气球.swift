//
//  452. 用最少数量的箭引爆气球.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func findMinArrowShots(_ points: [[Int]]) -> Int {
    let points = points.sorted {
        $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
    }
    var ans = 1
    var end = points[0][1]
    
    for point in points {
        if point[0] > end {
            ans += 1
            end = point[1]
        } else if point[1] < end {
            end = point[1]
        }
    }
    
    return ans
}
