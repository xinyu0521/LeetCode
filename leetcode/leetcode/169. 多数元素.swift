//
//  169. 多数元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/19.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var i = 0
    var cnt = 0
    
    for num in nums {
        if cnt == 0 {
            i = num
        }
        
        if i == num {
            cnt += 1
        } else {
            cnt -= 1
        }
    }
    
    return i
}
