//
//  1828. 统计一个圆中点的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/24.
//

import Foundation

func countPoints(_ points: [[Int]], _ queries: [[Int]]) -> [Int] {
    queries.reduce(into: [Int]()) { ans, q in
        ans.append(points.reduce(0) {
            $0 + (($1[0] - q[0]) * ($1[0] - q[0]) + ($1[1] - q[1]) * ($1[1] - q[1]) <= q[2] * q[2] ? 1 : 0)
        })
    }
}
