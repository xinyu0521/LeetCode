//
//  39. 组合总和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/20.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var ans: [[Int]] = []
    let candidates = candidates.sorted()
    
    func backtracking(_ nums: [Int], _ target: Int, _ begin: Int) {
        if target == 0 { ans.append(nums) }
        for i in begin ..< candidates.count {
            let candidate = candidates[i]
            if candidate > target {
                continue
            }
            backtracking(nums + [candidate], target - candidate, i)
        }
    }
    
    backtracking([], target, 0)
    return Array(ans)
}
