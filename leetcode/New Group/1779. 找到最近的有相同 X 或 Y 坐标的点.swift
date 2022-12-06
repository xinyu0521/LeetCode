//
//  1779. 找到最近的有相同 X 或 Y 坐标的点.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/1.
//

import Foundation

func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
    var d = Int.max
    var index = 0
    
    for i in points.indices {
        let point = points[i]
        if x == point[0] || y == point[1] {
            let l = abs(x - point[0]) + abs(y - point[1])
            if l < d {
                d = l
                index = i
            }
        }
    }
    
    return d == Int.max ? -1 : index
}
