//
//  433. 最小基因变化.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/7.
//

import Foundation

func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
    if start == end { return 0 }
    let set = Set(bank)
    if !set.contains(end) { return -1 }

    var q = ArraySlice<[String]>()
    var visited = Set<String>()
    q.append([start])
    var step = 0

    while !q.isEmpty {
        var next: [String] = []
        step += 1
        for str in q.removeFirst() {
            if visited.contains(str) { continue }
            visited.insert(str)
            let chars = Array(str)
            for c in "ACGT" {
                for i in 0 ..< chars.count {
                    if c == chars[i] { continue }
                    var newChars = Array(chars)
                    newChars[i] = c
                    let s = String(newChars)
                    if set.contains(s) {
                        if s == end {
                            return step
                        }
                        next.append(s)
                    }
                }
            }
        }

        if !next.isEmpty {
            q.append(next)
        }
    }

    return -1
}
