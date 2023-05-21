//
//  1658. 将 x 减到 0 的最小操作数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/8.
//

import Foundation

func minOperations(_ nums: [Int], _ x: Int) -> Int {
    let n = nums.count
    let sum = nums.reduce(0, +)
    if sum < x { return -1 }
    
    var r = 0
    var rsum = sum
    var lsum = 0
    var ans = n + 1
    
    for l in -1 ..< n {
        if l != -1 {
            lsum += nums[l]
        }
        
        while r < n, lsum + rsum > x {
            rsum -= nums[r]
            r += 1
        }
        
        if lsum + rsum == x {
            ans = min(ans, l + 1 + n - r)
        }
    }
    
    return ans > n ? -1 : ans
}
