//
//  357. 统计各位数字都不同的数字个数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/11.
//

import Foundation

func countNumbersWithUniqueDigits(_ n: Int) -> Int {
    if n == 0 { return 1 }
    var res = 10
    if n == 1 { return res }
    var last = 9
    for i in 2 ... n {
        let cur = last * (10 - i + 1)
        res += cur
        last = cur
        
    }
    
    return res
}
