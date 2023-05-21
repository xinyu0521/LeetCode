//
//  1051. 高度检查器.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/13.
//

import Foundation

func heightChecker(_ heights: [Int]) -> Int {
    var cnt = Array(repeating: 0, count: 101)
    for height in heights {
        cnt[height] += 1
    }
    var ans = 0
    var i = 0

    for j in 0 ..< cnt.count where cnt[j] != 0 {
        var count = cnt[j]
        while count > 0 {
            if j != heights[i] {
                ans += 1
            }
            count -= 1
            i += 1
        }
    }
    
    return ans
}
