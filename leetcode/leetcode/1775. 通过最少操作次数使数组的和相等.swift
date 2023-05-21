//
//  1775. 通过最少操作次数使数组的和相等.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/7.
//

import Foundation

func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
    
    var nums1 = nums1
    var nums2 = nums2
    
    if nums1.count * 6 < nums2.count ||
       nums2.count * 6 < nums1.count {
        return -1
    }
    
    var sum1 = nums1.reduce(0, +)
    var sum2 = nums2.reduce(0, +)
    var d = sum2 - sum1
    
    if d < 0 {
        d = -d
        (nums1, nums2) = (nums2, nums1)
    }
    
    var cnt = Array(repeating: 0, count: 6)
    
    for num in nums1 {
        cnt[6 - num] += 1
    }
    
    for num in nums2 {
        cnt[num - 1] += 1
    }
    
    var ans = 0
    
    for i in (1 ... 5).reversed() {
        if i * cnt[i] >= d {
            return ans + (d + i - 1) / i
        }
        ans += cnt[i]
        d -= i * cnt[i]
    }
    
    return ans
}
