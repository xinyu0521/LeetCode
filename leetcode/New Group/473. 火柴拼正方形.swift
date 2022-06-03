//
//  473. 火柴拼正方形.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/1.
//

import Foundation

func makesquare(_ matchsticks: [Int]) -> Bool {
    var sum = 0
    for i in matchsticks { sum += i }
    let matchsticks = matchsticks.sorted(by: >)
    if sum % 4 != 0 { return false }
    let length = sum / 4
    var edges = Array(repeating: 0, count: 4)
    func dfs(_ index: Int) -> Bool {
        if index == matchsticks.count { return true }
        for i in 0 ..< edges.count {
            edges[i] += matchsticks[index]
            if edges[i] <= length, dfs(index + 1) {
                return true
            }
            edges[i] -= matchsticks[index]
        }
        return false
    }
    return dfs(0)
}
