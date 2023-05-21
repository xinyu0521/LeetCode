//
//  977. 有序数组的平方.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/1.
//

import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    var left = 0
    var right = nums.count
    
    while left < right {
        let mid = (left + right) >> 1
        let val = nums[mid]
        
        if val > 0 {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    var ans: [Int] = []
    
    left = right - 1
    
    while left > -1, right < nums.count {
        
        let lv = pow(Double(nums[left]), 2)
        let rv = pow(Double(nums[right]), 2)
        if lv > rv {
            ans.append(Int(rv))
            right += 1
        } else {
            ans.append(Int(lv))
            left -= 1
        }
    }
    
    while left > -1 {
        ans.append(Int(pow(Double(nums[left]), 2)))
        left -= 1
    }
    
    while right < nums.count {
        ans.append(Int(pow(Double(nums[right]), 2)))
        right += 1
    }
    
    return ans
}
