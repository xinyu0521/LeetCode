//
//  636. 函数的独占时间.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/7.
//

import Foundation

enum TimeType {
    case start
    case end
}

func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    var ans: [Int] = Array(repeating: 0, count: n)
    var stack: [(id: Int, type: TimeType, time: Int)] = []
    var cur = -1
    for log in logs {
        let f = log.split(separator: ":")
        let e = (id: Int(f[0])!, type: f[1] == "start" ? TimeType.start : TimeType.end, time: Int(f[2])!)
        switch e.type {
        case .start:
            if let last = stack.last {
                let time = e.time - cur
                ans[last.id] += time
            }
            stack.append(e)
            cur = e.time
        case .end:
            let last = stack.removeLast()
            let time = e.time - cur + 1
            ans[e.id] += time
            cur = e.time + 1
        }
    }
    return ans
}
