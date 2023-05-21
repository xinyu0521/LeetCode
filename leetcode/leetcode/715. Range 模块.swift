//
//  715. Range 模块.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/27.
//

import Foundation

class RangeModule {
    
    var ranges: [(begin: Int, end: Int)] = []

    init() {
        
    }
    
    func addRange(_ left: Int, _ right: Int) {
        var newRanges: [(begin: Int, end: Int)] = []
        var inserted = false
        var begin = left
        var end = right
        for range in ranges {
            if range.begin > end, !inserted {
                newRanges.append((begin, end))
                inserted = true
            }
            
            if range.end < begin || range.begin > end {
                newRanges.append(range)
            } else {
                begin = min(range.begin, begin)
                end = max(range.end, end)
            }
        }
        
        if !inserted {
            newRanges.append((begin, end))
        }
        
        ranges = newRanges
    }
    
    func queryRange(_ left: Int, _ right: Int) -> Bool {
        var l = 0
        var r = ranges.count
        
        while l < r {
            let mid = (l + r) / 2
            let range = ranges[mid]
            
            if range.begin > right {
                r = mid
            } else if range.end < left {
                l = mid + 1
            } else {
                return range.begin <= left && range.end >= right
            }
        }
        
        return false
    }
    
    func removeRange(_ left: Int, _ right: Int) {
        var newRanges: [(begin: Int, end: Int)] = []
        for range in ranges {
            if range.begin >= right || range.end <= left {
                newRanges.append(range)
            } else {
                if range.begin < left {
                    newRanges.append((range.begin, left))
                }
                
                if range.end > right {
                    newRanges.append((right, range.end))
                }
            }
        }
        
        ranges = newRanges
    }
}
