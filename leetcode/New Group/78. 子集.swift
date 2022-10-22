//
//  78. 子集.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    let n = nums.count
    
    func backtracking(_ subs: [Int], _ begin: Int) {
        ans.append(subs)
        for i in begin ..< n {
            backtracking(subs + [nums[i]], i + 1)
        }
    }
    
    backtracking([], 0)
    return ans
}
