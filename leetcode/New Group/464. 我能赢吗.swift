//
//  464. 我能赢吗.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/22.
//

import Foundation

func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
    if (maxChoosableInteger + 1) * maxChoosableInteger < desiredTotal {
        return false
    }
    
    var memo: [Int: Bool] = [:]
    
    func dfs(_ used: Int, _ current: Int) -> Bool {
        if let ans = memo[used] {
            return ans
        }
        
        var ans = false
        
        for i in 1 ... maxChoosableInteger where (used >> (i - 1)) & 1 == 0 {
            if i + current >= desiredTotal || !dfs(used | (1 << (i - 1)), current + i) {
                ans = true
                break
            }
        }
        
        memo[used] = ans
        return ans
    }
    
    return dfs(0, 0)
}
