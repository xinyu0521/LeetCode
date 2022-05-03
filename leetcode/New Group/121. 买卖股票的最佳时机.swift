//
//  121. 买卖股票的最佳时机.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/13.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var res = 0
    var m = prices[0]
    
    for price in prices {
        res = max(res, price - m)
        m = min(price, m)
    }
    
    return res
}
