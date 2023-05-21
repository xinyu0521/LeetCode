//
//  1450. 在既定时间做作业的学生人数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/19.
//

import Foundation

func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
    zip(startTime, endTime).reduce(into: 0) {
        if ($1.0 ... $1.1).contains(queryTime) { $0 += 1 }
    }
}
