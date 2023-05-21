//
//  2335. 装满杯子需要的最短总时长.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/11.
//

import Foundation

func fillCups(_ amount: [Int]) -> Int {
    var amount = amount.sorted()
    return amount[2] > amount[0] + amount[1] ? amount[2] : (amount.reduce(0, +) + 1) / 2
}
