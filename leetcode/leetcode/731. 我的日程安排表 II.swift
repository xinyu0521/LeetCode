//
//  731. 我的日程安排表 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/19.
//

import Foundation

class MyCalendarTwo {
    
    var booked: [(start: Int, end: Int)] = []
    var overlaps: [(start: Int, end: Int)] = []
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        for book in overlaps where book.start < end && book.end > start {
            return false
        }
        
        for book in booked where book.start < end && book.end > start {
            overlaps.append((max(book.start, start), min(book.end, end)))
        }
        
        booked.append((start, end))
        return true
    }
}
