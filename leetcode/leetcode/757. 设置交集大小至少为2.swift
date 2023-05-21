//
//  757. 设置交集大小至少为2.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/22.
//

import Foundation

func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
    let ins = intervals.sorted{ $0[1] < $1[1]}
    var ans = 2
    var p1 = ins[0][1] - 1
    var p2 = ins[0][1]
    
    for pair in ins {
        if p1 >= pair[0], p2 <= pair[1] { continue }
        if p2 < pair[0] {
            p1 = pair[1] - 1
            p2 = pair[1]
            ans += 2
            continue
        }
        
        if p2 == pair[1] {
            p1 = pair[1] - 1
        } else {
            p1 = p2
            p2 = pair[1]
        }
        ans += 1
    }
    
    return ans
}
