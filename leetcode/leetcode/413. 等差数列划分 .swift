//
//  413. 等差数列划分 .swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/5.
//

import Foundation

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    var res = 0
    var i = 0
    
    while i < nums.count - 2 {
        var j = i + 1
        let d = nums[j] - nums[i]
        while j < nums.count - 1, nums[j + 1] - nums[j] == d {
            j += 1
        }
        
        let len = j - i + 1
        let al = 1
        let an = len - 3 + 1
        res += (al + an) * an / 2
        i = j
    }
    
    return res
}
