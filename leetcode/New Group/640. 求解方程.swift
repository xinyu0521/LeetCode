//
//  640. 求解方程.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/10.
//

import Foundation

func solveEquation(_ equation: String) -> String {
    var cntX = 0
    var sum = 0
    
    var m = 0
    var haveX = false
    var haveNum = false
    var cons = 1
    var sign = 1
    
    for c in equation {
        if c == "x" {
            haveX = true
            continue
        }
        
        if c.isNumber {
            m = m * 10 + Int(String(c))!
            haveNum = true
        } else {
            if haveX {
                cntX += (haveNum ? m : 1) * sign
            } else {
                sum += m * sign
            }
            
            if c == "-" {
                sign = -cons
            } else if c == "+" {
                sign = cons
            } else {
                cons = -1
                sign = cons
            }
            
            m = 0
            haveX = false
            haveNum = false
        }
    }
    
    if haveX {
        cntX += (haveNum ? m : 1) * sign
    } else {
        sum += m * sign
    }
    
    if cntX == 0 {
        if sum != 0 {
            return "No solution"
        }
        return "Infinite solutions"
    }
    
    return "x=\(-sum / cntX)"
}
