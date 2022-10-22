//
//  215. 数组中的第K个最大元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    var left = 0
    var right = nums.count - 1
    let target = nums.count - k
    
    while true {
        let pivotIndex = partition(left, right)
        if pivotIndex == target {
            return nums[pivotIndex]
        } else if pivotIndex < target {
            left = pivotIndex + 1
        } else {
            right = pivotIndex - 1
        }
    }
    
    func partition(_ l: Int, _ r: Int) -> Int {
        let random = Int.random(in: l ... r)
        let pivot = nums[random]
        nums.swapAt(l, random)
        
        var m = l + 1
        var n = r
        
        while true {
            while m <= n, nums[m] < pivot {
                m += 1
            }
            
            while m <= n, nums[n] > pivot {
                n -= 1
            }
            
            if m >= n {
                break
            }
            
            nums.swapAt(m, n)
            m += 1
            n -= 1
        }
        
        nums.swapAt(left, n)
        return n
    }
    
    return 0
}
