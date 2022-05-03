//
//  350. 两个数组的交集 II.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/3.
//

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var map: [Int: Int] = [:]
    var ans: [Int] = []
    
    for num in nums1 {
        map[num] = (map[num] ?? 0) + 1
    }
    
    for num in nums2 {
        let c = map[num] ?? 0
        if c == 0 {
            continue
        }
        
        ans.append(num)
        map[num]! -= 1
    }
    
    return ans
}
