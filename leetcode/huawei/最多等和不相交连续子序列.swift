//
//  最多等和不相交连续子序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func denghebuxiangjiaolianxuzixulie() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let n = Int(line1)!
        let nums = line2.split(separator: " ").map { Int($0)! }
        
        var preSums = Array(repeating: 0, count: n)
        preSums[0] = nums[0]
        for i in 1 ..< n {
            preSums[i] = preSums[i - 1] + nums[i]
        }
        var map: [Int: [(l: Int, r: Int)]] = [:]
        
        for i in 0 ..< n {
            for j in i ..< n {
                let sum = preSums[j] - (i == 0 ? 0 : preSums[i - 1])
                map[sum, default: []].append((i, j))
            }
        }
        
        var ans = 0
        
        for (_, val) in map {
            var count = 1
            let ranges = val.sorted { $0.r < $1.r }
            var t = ranges[0].r
            for range in ranges.dropFirst() {
                if t < range.l {
                    count += 1
                    t = range.r
                }
            }
            ans = max(ans, count)
        }
        
        print(ans)
    }
}
