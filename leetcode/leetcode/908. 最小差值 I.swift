//
//  908. 最小差值 I.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
    var maxNum = Int.min
    var minNum = Int.max
    
    for num in nums {
        maxNum = max(maxNum, num)
        minNum = min(minNum, num)
    }
        
    let diff = maxNum - minNum
    
    if diff <= k * 2 {
        return 0
    }
    
    return diff - k * 2
}
