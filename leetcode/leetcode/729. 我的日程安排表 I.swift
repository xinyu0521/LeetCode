//
//  729. 我的日程安排表 I.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/5.
//

import Foundation

class MyCalendar {
    
    private var arr: [(start: Int, end: Int)] = []
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        for i in arr {
            if start < i.end, end < i.start {
                return false
            }
        }
        arr.append((start, end))
        return true
    }
}
