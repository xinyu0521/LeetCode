//
//  1703. 得到连续 K 个 1 的最少相邻交换次数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/18.
//

import Foundation

func minMoves(_ nums: [Int], _ k: Int) -> Int {
    let pos = nums.indices.reduce(into: [Int]()) {
        if nums[$1] == 1 {
            $0.append($1)
        }
    }
    
    var ans = 0
    var count = 0
    var mid = k / 2
    
    for i in 1 ..< k {
        count += (pos[i] - pos[i - 1] - 1) * min(i, k - i)
    }
    
    ans = count
    
    for i in k ..< pos.count {
        count -= pos[i - k + mid] - pos[i - k]
        count += pos[i] - pos[i - mid]
        ans = min(ans, count)
    }
    
    return ans
}
