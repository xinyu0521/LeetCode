//
//  380. O(1) 时间插入、删除和获取随机元素.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/13.
//

import Foundation

class RandomizedSet {

    var nums = Array(repeating: 0, count: 200001)
    var map: [Int: Int] = [:]
    var index = 0
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if map[val] == nil {
            map[val] = index
            nums[index] = val
            index += 1
            return true
        } else {
            return false
        }
    }
    
    func remove(_ val: Int) -> Bool {
        let i = map[val]
        if i == nil {
            return false
        }
        index -= 1
        let loc = map.removeValue(forKey: val)
        if loc != index {
            map[nums[index]] = loc
        }
        nums[loc!] = nums[index]
        return true
    }
    
    func getRandom() -> Int {
        nums[Int.random(in: 0 ... index)]
    }
}
