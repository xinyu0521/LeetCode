//
//  1331. 数组序号转换.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/29.
//

import Foundation

func arrayRankTransform(_ arr: [Int]) -> [Int] {
    let map = Set(arr).sorted().enumerated().reduce(into: [Int: Int]()) { $0[$1.1] = $1.0 + 1 }
    return arr.map { map[$0]! }
}
