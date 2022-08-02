//
//  面试题 01.05. 一次编辑.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func oneEditAway(_ first: String, _ second: String) -> Bool {
    if first == second { return true }
    
    var firsts = ArraySlice(first)
    var seconds = ArraySlice(second)
    
    if abs(firsts.count - seconds.count) > 1 {
        return false
    }
    
    while firsts.first == seconds.first {
        firsts.removeFirst()
        seconds.removeFirst()
    }
    
    while firsts.last == seconds.last {
        firsts.removeLast()
        seconds.removeLast()
    }
    
    if firsts.count < 2, seconds.count < 2 {
        return true
    }
    
    return false
}
