//
//  1798. 你能构造出连续值的最大数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/4.
//

import Foundation

func getMaximumConsecutive(_ coins: [Int]) -> Int {
    let coins = coins.sorted()
    var res = 1
    for coin in coins {
        if coin > res {
            break
        }
        res += coin
    }
    
    return res
}
