//
//  875. 爱吃香蕉的珂珂.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/7.
//

import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var left = 1
    var right = piles.max() ?? 1
    
    while left < right {
        let mid = left + (right - left) / 2
        var sumH = 0
        for piles in piles {
            sumH += (piles + mid - 1) / mid
        }
        
        if sumH > h {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return left
}
