//
//  860. 柠檬水找零.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func lemonadeChange(_ bills: [Int]) -> Bool {
    var five = 0
    var ten = 0
    var twenty = 0
    
    for bill in bills {
        if bill == 5 {
            five += 1
        } else if bill == 10 {
            if five > 0 {
                five -= 1
                ten += 1
            } else {
                return false
            }
        } else {
            if ten > 0 {
                ten -= 1
                if five > 0 {
                    five -= 1
                    twenty += 1
                } else {
                    return false
                }
            } else {
                if five >= 3 {
                    five -= 3
                    twenty += 1
                } else {
                    return false
                }
            }
        }
    }
    
    return true
}
