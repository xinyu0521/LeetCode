//
//  2037. 使每位学生都有座位的最少移动次数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/31.
//

import Foundation

func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
    zip(seats.sorted(), students.sorted()).reduce(0) {
        $0 + abs($1.0 - $1.1)
    }
}
