//
//  621. 任务调度器.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var cnt = Array(repeating: 0, count: 26)
    for task in tasks {
        cnt[Int(task.asciiValue!) - 65] += 1
    }
    cnt.sort()
    var minL = (cnt[25] - 1) * (n + 1) + 1
    for i in (0 ..< 25).reversed() {
        if cnt[i] == cnt[25] {
            minL += 1
        }
    }
    return max(minL, tasks.count)
}
