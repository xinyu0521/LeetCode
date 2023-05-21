//
//  2032. 至少在两个数组中出现的值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/29.
//

import Foundation

func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    let set3 = Set(nums3)
    
    return Array(set1.intersection(set2).union(set2.intersection(set3)).union(set1.intersection(set3)))
}
