//
//  总最快检测效率.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func zuikuaijiancexialv() {
    while let line = readLine() {
        let nm = line.split(separator: " ").map { Int($0)! }
        let n = nm[0]
        let m = nm[1]
        let effs = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
        var ps = Array(repeating: 0, count: n)
        
        if m <= n {
            for i in 0 ..< m {
                ps[i] = 1
            }
        } else {
            for i in 0 ..< n {
                ps[i] = 1
            }
            let k = (m - n) / 3
            for i in 0 ..< k {
                ps[i] += 3
            }
            ps[k] += (m - n) % 3
        }
        
        var i = 0
        var j = n - 1
        
        while i < j {
            if ps[i] == 4 {
                i += 1
                continue
            }
            if ps[j] == 0 {
                j -= 1
                continue
            }
            
            let ic = effs[i] / 10
            let dc = effs[j] / 10 * (ps[j] > 1 ? 1 : 2)
            
            if ic > dc {
                ps[i] += 1
                ps[j] -= 1
            } else {
                break
            }
        }
        
        var ans = 0
        for i in 0 ..< n {
            var sum = effs[i]
            let p = ps[i]
            if p == 0 {
                sum -= effs[i] / 10 * 2
            } else if p > 1 {
                sum += effs[i] / 10 * (ps[i] - 1)
            }
            ans += sum
        }
        
        print(ans)
    }
}
