//
//  954.canReorderDoubled.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/1.
//

import Foundation

func canReorderDoubled(_ arr: [Int]) -> Bool {
    var needMap: [Int: Int] = [:]
    let list = arr.sorted { abs($0) < abs($1) }
    
    for i in list {
        let need = i * 2
        
        if needMap[i] != nil, needMap[i]! > 0 {
            needMap[i]! -= 1
            continue
        }
        
        if abs(need) > abs(list.last!) {
            return false
        }
        
        needMap[need] = (needMap[need] ?? 0) + 1
    }
    
    for (_, val) in needMap where val != 0 {
        return false
    }
    
    return true
}
