//
//  1037. 有效的回旋镖.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/8.
//

import Foundation

func isBoomerang(_ points: [[Int]]) -> Bool {
    let v1 = [points[1][0] - points[0][0], points[1][1] - points[0][1]]
    let v2 = [points[2][0] - points[0][0], points[2][1] - points[0][1]]
    return v1[0] * v2[1] - v1[1] * v2[0] != 0
}
