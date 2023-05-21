//
//  1475. 商品折扣后的最终价格.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/1.
//

import Foundation

func finalPrices(_ prices: [Int]) -> [Int] {
    let n = prices.count
    var arr = Array(repeating: 0, count: n)
    var stack: [Int] = []
    
    for i in prices.indices.reversed() {
        while !stack.isEmpty,
              stack.last! > prices[i] {
            stack.removeLast()
        }
    
        if let last = stack.last {
            arr[i] = last
        }
        
        stack.append(prices[i])
    }
    
    return zip(prices, arr).reduce(into: [Int]()) { $0.append($1.0 - $1.1) }
}
