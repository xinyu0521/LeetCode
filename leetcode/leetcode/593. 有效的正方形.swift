//
//  593. 有效的正方形.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/29.
//

import Foundation

func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    if p1 == p2 { return false }
    if help(p1, p2, p3, p4) { return true }
    if p1 == p3 { return false }
    if help(p1, p3, p2, p4) { return true }
    if p1 == p4 { return false }
    if help(p1, p4, p2, p3) { return true }
    return false
}

func help(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    let v1 = [p1[0] - p2[0], p1[1] - p2[1]]
    let v2 = [p3[0] - p4[0], p3[1] - p4[1]]
    
    if checkMidPoint(p1, p2, p3, p4),
       checkLength(v1, v2),
       calCos(v1, v2)
    {
        return true
    }
    
    return false
}

func checkMidPoint(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    (p1[0] + p2[0] == p3[0] + p4[0]) && (p1[1] + p2[1] == p3[1] + p4[1])
}

func checkLength(_ v1: [Int], _ v2: [Int]) -> Bool {
    (v1[0] * v1[0] + v1[1] * v1[1]) == (v2[0] * v2[0] + v2[1] * v2[1])
}

func calCos(_ v1: [Int], _ v2: [Int]) -> Bool {
    v1[0] * v2[0] + v1[1] * v2[1] == 0
}
