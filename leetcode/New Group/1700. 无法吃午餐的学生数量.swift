//
//  1700. 无法吃午餐的学生数量.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/19.
//

import Foundation

func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var cnt = students.reduce(into: Array(repeating: 0, count: 2)) { $0[$1] += 1 }
    for i in sandwiches.indices {
        if cnt[sandwiches[i]] > 0 {
            cnt[sandwiches[i]] -= 1
        } else {
            return sandwiches.count - i
        }
    }
    return 0
}
