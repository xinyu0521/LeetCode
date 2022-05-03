//
//  11.maxArea.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/1.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    if height.count < 2 {
        return 0
    }
    var res = 0
    var i = 0
    var j = height.count - 1
    
    while i < j {
        let w = j - i
        let h = min(height[i], height[j])
        res = max(res, w * h)
        
        if height[i] > height[j] {
            j -= 1
        } else {
            i += 1
        }
    }
    
    return res
}
