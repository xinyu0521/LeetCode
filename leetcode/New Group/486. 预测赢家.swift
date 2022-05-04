//
//  486. 预测赢家.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func PredictTheWinner(_ nums: [Int]) -> Bool {
    var dp: [[Int]: Int] = [:]
    func getScore(_ l: Int, _ r: Int) -> Int {
        
        if l == r { return nums[l] }
        
        if let ans = dp[[l, r]] {
            return ans
        }
        
        let ans = max(nums[l] - getScore(l + 1, r), nums[r] - getScore(l, r - 1))
        dp[[l, r]] = ans
        
        return ans
    }
    
    return getScore(0, nums.count - 1) >= 0
}
