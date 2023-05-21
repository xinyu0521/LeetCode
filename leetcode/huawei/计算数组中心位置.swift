//
//  计算数组中心位置.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func jisuanshuzuzhongxinweizhi() {
    while let line = readLine() {
        let nums = line.split(separator: " ").map { Int($0)! }
        var left = 1
        var right = nums.reduce(1, *)
        
        var ans = -1
        
        for i in nums.indices {
            left *= (i == 0 ? 1 : nums[i - 1])
            right /= nums[i]
            if left == right {
                ans = i
                break
            }
        }
        
        print(ans)
        
    }
}
