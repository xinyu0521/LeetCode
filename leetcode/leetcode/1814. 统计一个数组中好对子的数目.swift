//
//  1814. 统计一个数组中好对子的数目.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/17.
//

import Foundation

func countNicePairs(_ nums: [Int]) -> Int {
    let mod = 1000000007
    var map: [Int: Int] = [:]
    var res = 0
    for i in nums {
        var n = i
        var j = 0
        while n > 0 {
            j = j * 10 + n % 10
            n /= 10
        }
        res += map[i - j, default: 0] % mod
        map[i - j, default: 0] += 1
    }
    
    return res % mod
}
