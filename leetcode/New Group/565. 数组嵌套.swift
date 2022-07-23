//
//  565. 数组嵌套.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/17.
//

import Foundation

func arrayNesting(_ nums: [Int]) -> Int {
    let n = nums.count
    var visited = Array(repeating: false, count: n)
    var ans = 0
    for i in 0 ..< n {
        var cnt = 0
        var j = i
        while !visited[j] {
            visited[j] = true
            j = nums[j]
            cnt += 1
        }
        ans = max(ans, cnt)
    }
    
    return ans
}
