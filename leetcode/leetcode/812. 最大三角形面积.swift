//
//  812. 最大三角形面积.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/15.
//

import Foundation

func largestTriangleArea(_ points: [[Int]]) -> Double {
    
    func triangleArea(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ x3: Int, _ y3: Int) -> Double {
        abs(Double(((y1 + y2) * (x2 - x1) + (y2 + y3) * (x3 - x2) - (y1 + y3) * (x3 - x1))) * 0.5)
    }
    
    var ans: Double = 0
    
    for i in 0 ..< points.count {
        for j in i + 1 ..< points.count {
            for k in j + 1 ..< points.count {
                ans = max(ans, triangleArea(points[i][0], points[i][1], points[j][0], points[j][1], points[k][0], points[k][1]))
            }
        }
    }
    
    return ans
}
