//
//  1780. 判断一个数字是否可以表示成三的幂的和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func checkPowersOfThree(_ n: Int) -> Bool {
    var n = n
    while n > 0 {
        if n % 3 == 2 {
            return false
        }
        n /= 3
    }
    
    return true
}
