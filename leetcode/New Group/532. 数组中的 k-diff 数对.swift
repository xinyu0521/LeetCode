//
//  532. 数组中的 k-diff 数对.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/16.
//

import Foundation

func findPairs(_ nums: [Int], _ k: Int) -> Int {
    var visited: Set<Int> = []
    var res: Set<Int> = []
    
    for num in nums {
        if visited.contains(num - k) {
            res.insert(num - k)
        }
        if visited.contains(num + k) {
            res.insert(num)
        }
        visited.insert(num)
    }
    
    return res.count
}
