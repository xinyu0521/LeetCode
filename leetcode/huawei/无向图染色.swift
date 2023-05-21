//
//  无向图染色.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func wuxianturanse() {
    while let line = readLine() {
        let mn = line.split(separator: " ").map { Int($0)! }
        let m = mn[0]
        let n = mn[1]
        var g: [Int: Set<Int>] = [:]
        for _ in 0 ..< n {
            if let line = readLine() {
                let vs = line.split(separator: " ").map { Int($0)! }
                g[vs[0], default: []].insert(vs[1])
                g[vs[1], default: []].insert(vs[0])
            }
        }
        
        var ans = 0
        
        func backtraking(_ begin: Int, reds: [Int]) {
            
            if begin > m { return }
            
        outer:
            for i in begin ... m {
                for red in reds {
                    if g[red, default: []].contains(i) {
                        continue outer
                    }
                }
                
                ans += 1
                backtraking(i + 1, reds: reds + [i])
            }
        }
        
        backtraking(1, reds: [])
        
        print(ans + 1)
    }
}

