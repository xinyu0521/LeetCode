//
//  658. 找到 K 个最接近的元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/25.
//

import Foundation

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = start + (end - start) / 2
        let n = arr[mid]
        if x < n {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    var count = k
    var i = start - 1
    var j = start
    while count > 0 {
        if arr.indices.contains(i) && arr.indices.contains(j) {
            if abs(arr[i] - x) <= abs(arr[j] - x) {
                i -= 1
            } else {
                j += 1
            }
        } else if arr.indices.contains(i) {
            i -= 1
        } else {
            j += 1
        }
        
        count -= 1
    }
    
    return Array(arr[i + 1 ..< j])
}
