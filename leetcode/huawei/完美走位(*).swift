//
//  完美走位.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func wanmeizouwei() {
    while let line = readLine() {
        let chars = Array(line)
        let n = chars.count
        let map = chars.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        let avg = n / 4
        var needCount = 0
        var need = map.reduce(into: [Character: Int]()) {
            let diff = $1.value - avg
            if diff > 0 {
                $0[$1.key] = diff
                needCount += diff
            }
        }
        
//        if needCount == 0 {
//            print(0)
//            return
//        }
        
        var i = 0
        var j = 0
        var minLength = Int.max
        
        while j < n {
            let c = chars[j]
            
            if need[c, default: 0] > 0 {
                needCount -= 1
            }
            
            need[c, default: 0] -= 1
            
            while needCount == 0, i < n {
                minLength = min(minLength, j - i + 1)
                let l = chars[i]
                
                if need[l, default: 0] == 0 {
                    needCount += 1
                }
                need[l, default: 0] += 1
                i += 1
            }
            j += 1
        }
        
        print(minLength)
    }
}
