//
//  1817. 查找用户活跃分钟数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/20.
//

import Foundation

func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
    Set(logs).reduce(into: [Int: Int]()) {
        $0[$1[0], default: 0] += 1
    }
    .reduce(into: [Int](repeating: 0, count: k)) {
        $0[$1.value - 1] += 1
    }
}
