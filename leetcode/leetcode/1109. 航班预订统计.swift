//
//  1109. 航班预订统计.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
    var ans = Array(repeating: 0, count: n)
    for booking in bookings {
        let start = booking[0] - 1
        let end = booking[1]
        let val = booking[2]
        ans[start] += val
        if end < n {
            ans[end] -= val
        }
    }
    
    for i in 1 ..< n {
        ans[i] += ans[i - 1]
    }
    
    return ans
}
