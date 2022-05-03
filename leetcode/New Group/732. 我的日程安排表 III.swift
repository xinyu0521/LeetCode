//
//  732. 我的日程安排表 III.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/29.
//

import Foundation

class MyCalendarThree {
    
    var list: [Int] = []
    var map: [Int: Int] = [:]

    init() {

    }
    
    func book(_ start: Int, _ end: Int) -> Int {
        insert(start)
        insert(end)
        map[start] = (map[start] ?? 0) + 1
        map[end] = (map[end] ?? 0) - 1
        
        var ans = 0
        var count = 0
        for key in list {
            count += map[key] ?? 0
            ans = max(ans, count)
        }
        
        return ans
    }
    
    func insert(_ val: Int) {
        var left = 0
        var right = list.count
        
        while left < right {
            let mid = (left + right) >> 1
            if list[mid] > val {
                right = mid
            } else if list[mid] < val {
                left = mid + 1
            } else {
                return
            }
        }
        
        list.insert(val, at: left)
    }
}
