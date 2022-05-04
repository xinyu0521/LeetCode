//
//  1823. 找出游戏的获胜者.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func findTheWinner(_ n: Int, _ k: Int) -> Int {
    var set = Set<Int>()
    var i = 1
    var m = 0
    while true {
        if set.count == n - 1 {
            break
        }
        
        if !set.contains(m % n + 1) {
            if i % k == 0 {
                set.insert(m % n + 1)
            }
            
            i += 1
        }
    
        
        m += 1
    }
    
    for i in 1 ... n where !set.contains(i) {
        return i
    }
    
    return 0
}
