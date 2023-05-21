//
//  工单调度策略.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func gongdandiaoducelue() {
    while let line = readLine() {
        let n = Int(line)!
        var ws: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                ws.append(line.split(separator: " ").map { Int($0)! })
            }
        }
        ws.sort { $0[0] < $1[0] }
        
        var heap: Heap<[Int]> = Heap(elements: []) {
            $0[1] < $1[1]
        }
        
        var curTime = 0
        var ans = 0
        
        for w in ws {
            if w[0] >= curTime + 1 {
                heap.insert(w)
                ans += w[1]
                curTime += 1
            } else {
                if let top = heap.peek() {
                    if top[1] < w[1] {
                        heap.remove()
                        heap.insert(w)
                        ans += w[1]
                        ans -= top[1]
                    }
                }
            }
        }
        
        print(ans)
    }
}
