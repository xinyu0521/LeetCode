//
//  667. 优美的排列 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/8.
//

import Foundation

func constructArray(_ n: Int, _ k: Int) -> [Int] {
    var left = 1
    var right = n
    var res: [Int] = []
    
    for i in 0 ..< k {
        if i % 2 == 0 {
            res.append(left)
            left += 1
        } else {
            res.append(right)
            right -= 1
        }
    }
    
    if k % 2 == 0 {
        for i in (left ... right).reversed() {
            res.append(i)
        }
    } else {
        for i in left ... right {
            res.append(i)
        }
    }
    
    return res
}
