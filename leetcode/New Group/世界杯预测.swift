//
//  世界杯预测.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/11/29.
//

import Foundation

func katar(_ points: [[Int]]) {
    let m = 8 // 总进球的8种选法
    let n = 31 // 比分的31种选法
    let round = 4 //场次

    let totalPoints = points
        .reduce(into: Array(repeating: 0, count: round)) {
            for i in 0 ..< round {
                $0[i] += $1[i]
            }
        }
    
    print("总进球：")
    for i in 0 ..< round {
        var sum = 0
        for _ in 0 ..< totalPoints[i] {
            sum += Int.random(in: 0 ..< m)
        }
        
        print("第\(i + 1)场: \((sum % m))")
    }
    
    print("比分：")
    for i in 0 ..< round {
        var sum = 0
        for _ in 0 ..< totalPoints[i] {
            sum += Int.random(in: 0 ..< n)
        }
        
        print("第\(i + 1)场: \((sum % n))")
    }
}
