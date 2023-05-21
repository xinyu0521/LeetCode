//
//  376. 摆动序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/8.
//

import Foundation

func wiggleMaxLength(_ nums: [Int]) -> Int {
    if nums.count == 1 { return 1}
    var diffs: [Int] = []
    for i in 1 ..< nums.count {
        diffs.append(nums[i - 1] - nums[i])
    }
    
    var f = diffs[0] > 0
    var ans = 0
    
    for diff in diffs {
        if (diff > 0) && f {
            ans += 1
            f.toggle()
        }
    }
    
    return ans + 1
}
