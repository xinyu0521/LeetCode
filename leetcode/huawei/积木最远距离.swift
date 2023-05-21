//
//  积木最远距离.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func jimuzuiyuanjuli() {
    while let line = readLine() {
        let n = Int(line)!
        var map: [Int: Int] = [:]
        var ans = -1
        for i in 0 ..< n {
            if let line = readLine() {
                let num = Int(line)!
                let left = map[num, default: -1]
                if left == -1 {
                    map[num] = i
                } else {
                    ans = max(ans, i - left)
                }
            }
        }
        print(ans)
    }
}
