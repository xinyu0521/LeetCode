//
//  1252. 奇数值单元格的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/12.
//

import Foundation

func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
    var ms = Array(repeating: 0, count: m)
    var ns = Array(repeating: 0, count: n)
    
    for index in indices {
        ms[index[0]] += 1
        ns[index[1]] += 1
    }
    
    var odd = 0
    for i in 0 ..< m {
        for j in 0 ..< n where (ms[i] + ns[j]) % 2 == 1 {
            odd += 1
        }
    }
    
    return odd
}
