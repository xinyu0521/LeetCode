//
//  719. 找出第 K 小的数对距离.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/15.
//

import Foundation

func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
    
    let nums = nums.sorted()
    var left = 0
    var right = nums.last! - nums.first!
    
    func binarySearchLeft(_ target: Int, _ end: Int) -> Int {
        var left = 0
        var right = end
        
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
    
    while left <= right {
        let mid = left + (right - left) / 2
        var cnt = 0
        
        for j in nums.indices {
            let i = binarySearchLeft(nums[j] - mid, j)
            cnt += j - i
        }
        
        if cnt >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}
