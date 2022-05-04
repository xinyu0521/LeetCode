//
//  118. 杨辉三角.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    var ans: [[Int]] = [[1]]
    var numRows = numRows
    
    while numRows > 1 {
        var nums: [Int] = []
        nums.append(1)
        
        if let last = ans.last {
            for i in 0 ..< last.count - 1 {
                nums.append(last[i] + last[i + 1])
            }
        }
        
        nums.append(1)
        
        ans.append(nums)
        numRows -= 1
    }
    
    return ans
}
