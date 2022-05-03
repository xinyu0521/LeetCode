//
//  398. 随机数索引.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/25.
//

import Foundation

class Solution {
    
    let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func pick(_ target: Int) -> Int {
        var res = 0
        var cnt = 0
        
        for i in 0 ..< nums.count {
            let num = nums[i]
            if num == target {
                cnt += 1
                if Int.random(in: 0 ..< cnt) == 0 {
                    res = i
                }
            }
        }
        
        return res
    }
}
