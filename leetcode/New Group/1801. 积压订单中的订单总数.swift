//
//  1801. 积压订单中的订单总数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/2.
//

import Foundation

func getNumberOfBacklogOrders(_ orders: [[Int]]) -> Int {
    var buys = Heap(elements: [[Int]]()) { $0[0] > $1[0] }
    var sells = Heap(elements: [[Int]]()) { $0[0] < $1[0] }
    
    for order in orders {
        let price = order[0]
        var amount = order[1]
        let type = order[2]
        
        if type == 0 {
            while amount > 0, !sells.isEmpty, sells.peek()![0] <= price {
                var order = sells.remove()!
                if order[1] > amount {
                    order[1] -= amount
                    amount = 0
                    sells.insert(order)
                } else {
                    amount -= order[1]
                }
            }
            if amount > 0 {
                buys.insert([price, amount, type])
            }
        } else {
            while amount > 0, !buys.isEmpty, buys.peek()![0] >= price {
                var order = buys.remove()!
                if order[1] > amount {
                    order[1] -= amount
                    amount = 0
                    buys.insert(order)
                } else {
                    amount -= order[1]
                }
            }
            if amount > 0 {
                sells.insert([price, amount, type])
            }
        }
    }
    
    return (buys.elements + sells.elements).reduce(0) {
        ($0 + $1[1]) % 1000000007
    }
}
