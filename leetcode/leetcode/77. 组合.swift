//
//  77. 组合.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/10.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var ans: [[Int]] = []
    var arr: [Int] = []
    
    func combine(_ begin: Int, _ m: Int) {
        if m == 0 {
            ans.append(arr)
            return
        }

        for i in begin ... (n - m + 1) {
            arr.append(i)
            combine(i + 1, m - 1)
            arr.removeLast()
        }
    }
    
    combine(1, k)
    
    return ans
}
