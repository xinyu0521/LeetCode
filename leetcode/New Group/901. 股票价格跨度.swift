//
//  901. 股票价格跨度.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

class StockSpanner {
    
    var stack: [Int] = []
    var map: [Int: Int] = [:]

    init() {
        
    }
    
    func next(_ price: Int) -> Int {
        var count = 1
        while !stack.isEmpty, stack.last! <= price {
            let last = stack.removeLast()
            count += map[last] ?? 0
        }
        map[price] = count
        stack.append(price)
        return count
    }
}
