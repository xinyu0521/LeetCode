//
//  1760. 袋子里最少数目的球.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/20.
//

import Foundation

func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
    var left = 1
    var right = nums.max()!
    var ans = 0
    
    while left < right {
        let mid = left + (right - left) / 2
        var opt = 0
        for num in nums {
            opt += (num - 1) / mid
        }
        
        if opt <= maxOperations {
            ans = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return ans
}
