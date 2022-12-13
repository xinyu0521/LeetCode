//
//  135. 分发糖果.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func candy(_ ratings: [Int]) -> Int {
    let n = ratings.count
    var ans = Array(repeating: 1, count: n)
    
    for i in 1 ..< n {
        if ratings[i] > ratings[i - 1] {
            ans[i] += 1
        }
    }
    
    for i in (0 ..< n - 1).reversed() {
        if ratings[i] > ratings[i + 1] {
            ans[i] = max(ans[i], ans[i + 1] + 1)
        }
    }
    
    return ans.reduce(0, +)
}
