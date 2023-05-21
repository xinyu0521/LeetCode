//
//  1296. 划分数组为连续数字的集合.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/18.
//

import Foundation

func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
    var map: [Int: Int] = [:]
    for num in nums {
        map[num] = (map[num] ?? 0) + 1
    }
    let newNums = map.keys.sorted()
    
    var start = 0
    while start < newNums.count {
        if map[newNums[start]] == 0 {
            start += 1
            continue
        }
        let end = start + k
        if end > newNums.count { return false }
        
        for i in start ..< end {
            if map[newNums[i]] == 0 {return false }
            if i > start, newNums[i] - newNums[i - 1] != 1 { return false }
            map[newNums[i]]! -= 1
        }
    }
    
    return true
}
