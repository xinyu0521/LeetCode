//
//  1774. 最接近目标价格的甜点成本.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/4.
//

import Foundation

func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
    
    var price = baseCosts[0]
    
    func backTracking(_ total: Int, _ index: Int) {
        
        if index == toppingCosts.count { return }
        
        if abs(target - price) > abs(target - total) {
            price = total
        } else if abs(target - price) == abs(target - total),
                  total < price {
            price = total
        }
        
        backTracking(total + toppingCosts[index] * 2, index + 1)
        backTracking(total + toppingCosts[index], index + 1)
        backTracking(total, index + 1)
    }
    
    for baseCost in baseCosts {
        backTracking(baseCost, 0)
    }
    
    return price
}
