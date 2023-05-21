//
//  最优高铁城市修建方案.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func gaotiefangan() {
    while let line = readLine() {
        let nums = line.split(separator: " ").map { Int($0)! }
        let vCount = nums[0]
        let endgesCount = nums[1]
        let mustCount = nums[2]
        var count = vCount
        var total = 0
        
        var map: [[Int]: Int] = [:]
        for _ in 0 ..< endgesCount {
            if let line = readLine() {
                let info = line.split(separator: " ").map { Int($0)! }
                map[[info[0], info[1]]] = info[2]
            }
        }
        
        var uf = Array(0 ..< vCount)
        
        func find(_ i: Int) -> Int {
            if i != uf[i] {
                uf[i] = find(uf[i])
            }
            return uf[i]
        }
        
        func union(_ i: Int, _ j: Int) {
            let m = find(i)
            let n = find(j)
            if m != n {
                uf[n] = m
                count -= 1
            }
        }
        
        for _ in 0 ..< mustCount {
            if let line = readLine() {
                let info = line.split(separator: " ").map { Int($0)! }
                total += map[[info[0], info[1]], default: 0]
                union(info[0] - 1, info[1] - 1)
            }
        }
        
        let sorted = map.sorted { $0.value < $1.value }
        
        for (key, value) in sorted {
            if find(key[0] - 1) != find(key[1] - 1) {
                union(key[0] - 1, key[1] - 1)
                total += value
            }
            if count == 1 {
                break
            }
        }
        
        if count != 1 {
            print(-1)
        } else {
            print(total)
        }
    }
}
