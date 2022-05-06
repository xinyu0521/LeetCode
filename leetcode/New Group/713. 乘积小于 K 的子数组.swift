//
//  713. 乘积小于 K 的子数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/5.
//

import Foundation

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k <= 1 { return 0 }
    var product = 1
    var left = 0
    var right = 0
    var ans = 0
    
    while right < nums.count {
        product *= nums[right]
        
        while product >= k {
            product /= nums[left]
            left += 1
        }
        
        ans += right - left + 1
        right += 1
    }
    
    return ans
}
