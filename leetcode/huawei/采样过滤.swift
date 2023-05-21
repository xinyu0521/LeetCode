//
//  采样过滤.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

//差分数组

func caiyangguolv() {
    while let line = readLine() {
        let n = Int(line)!
        var tasks: [[Int]] = []
        var maxTime = 0
        for _ in 0 ..< n {
            if let line = readLine() {
                let task = line.split(separator: " ").map { Int($0)! }
                maxTime = max(maxTime, task[1])
                tasks.append(task)
            }
        }
        
        var diff = Array(repeating: 0, count: maxTime + 1)
        for task in tasks {
            let start = task[0]
            let end = task[1]
            let val = task[2]
            diff[start] += val
            diff[end] -= val
        }
        
        var ans = diff[0]
        for i in 1 ..< diff.count {
            let val = diff[i] + diff[i - 1]
            ans = max(ans, val)
            diff[i] = val
        }
        
        print(ans)
    }
    
}
