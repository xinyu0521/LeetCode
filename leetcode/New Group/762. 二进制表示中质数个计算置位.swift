//
//  762. 二进制表示中质数个计算置位.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/5.
//

import Foundation

class Solution762 {
    
    let set: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        var res = 0
        for i in left ... right {
            var count = 0
            var num = i
            while num > 0 {
                count += 1
                num -= num & -num
            }
            
            if set.contains(count) {
                res += 1
            }
        }
        
        return res
    }
}
