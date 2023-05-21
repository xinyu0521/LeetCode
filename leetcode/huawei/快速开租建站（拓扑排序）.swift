//
//  快速开租建站（拓扑排序）.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func kuaisukaizuzhandian() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let n = Int(line1)!
        let m = Int(line2)!
        var map: [Int: [Int]] = [:]
        var cnt = Array(repeating: 0, count: n)
        
        for _ in 0 ..< m {
            if let line = readLine() {
                let vs = line.split(separator: " ").map { Int($0)! }
                let v1 = vs[0]
                let v2 = vs[1]
                map[v1, default: []].append(v2)
                cnt[v2] += 1
            }
        }
        
        var arr = cnt.indices.filter { cnt[$0] == 0 }
        var ans = 0
        while !arr.isEmpty {
            ans += 1
            var new: [Int] = []
            for i in arr {
                for v in map[i, default: []] {
                    cnt[v] -= 1
                    if cnt[v] == 0 {
                        new.append(v)
                    }
                }
            }
            arr = new
        }
        
        print(ans)
    }
}
