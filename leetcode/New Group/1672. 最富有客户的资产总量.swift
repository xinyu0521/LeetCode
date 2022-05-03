//
//  1672. 最富有客户的资产总量.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/14.
//

import Foundation

func maximumWealth(_ accounts: [[Int]]) -> Int {
    var res = 0
    for account in accounts {
        var sum = 0
        for money in account {
            sum += money
        }
        res = max(res, sum)
    }
    return res
}
