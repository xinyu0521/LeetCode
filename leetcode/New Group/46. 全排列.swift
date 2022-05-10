//
//  46. 全排列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/10.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var path: [Int] = []
    var set: Set<Int> = []
    
    func backTracking() {
        if path.count == nums.count {
            res.append(path)
            return
        }
        
        for num in nums where !set.contains(num) {
            path.append(num)
            set.insert(num)
            backTracking()
            path.removeLast()
            set.remove(num)
        }
    }
    
    backTracking()
    
    return res
}
