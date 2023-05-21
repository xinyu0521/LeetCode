//
//  1619. 删除某些元素后的数组均值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/14.
//

import Foundation

func trimMean(_ arr: [Int]) -> Double {
    let n = arr.count
    let m = Int(Double(n) * 0.05)
    let arr = arr.sorted(by: <)
    let total = arr[m ..< n - m].reduce(into: 0) { $0 += $1 }
    return Double(total) / Double(n - m * 2)
}
