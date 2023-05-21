//
//  88. 合并两个有序数组.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/2.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var ans: [Int] = []
    var i = 0
    var j = 0
    
    while i < m, j < n {
        if nums1[i] <= nums2[j] {
            ans.append(nums1[i])
            i += 1
        } else {
            ans.append(nums2[j])
            j += 1
        }
    }
    
    while i < m {
        ans.append(nums1[i])
        i += 1
    }
    
    while j < n {
        ans.append(nums2[j])
        j += 1
    }
    
    nums1 = ans
}
