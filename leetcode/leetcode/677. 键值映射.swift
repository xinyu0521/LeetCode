//
//  677. 键值映射.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/21.
//

import Foundation

class MapSum {
    
    var map :[String: Int] = [:]
    var sumMap: [String: Int] = [:]

    init() {

    }
    
    func insert(_ key: String, _ val: Int) {
        
        let diff = val - (map[key] ?? 0)
        map[key] = val
        
        for i in 0 ..< key.count {
            let sumKey = String(key.prefix(i))
            if sumMap[sumKey] == nil {
                sumMap[sumKey] = val
            } else {
                sumMap[sumKey]! += diff
            }
        }
    }
    
    func sum(_ prefix: String) -> Int {
        sumMap[prefix] ?? 0
    }
}
