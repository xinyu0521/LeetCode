//
//  区间交叠问题.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func qujianjiaodie() {
    while let line = readLine() {
        let n = Int(line)!
        var ranges: [(start: Int, end: Int)] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let range = line.split(separator: " ").map { Int($0)! }
                ranges.append((range[0], range[1]))
            }
        }
        
        ranges.sort {
            if $0.start < $1.start {
                return true
            } else if $0.start == $1.start {
                return $0.end > $1.end
            }
            return false
        }
        
        var stack = [ranges[0]]
        
        for range in ranges.dropFirst() {
            while !stack.isEmpty && stack.last!.end <= range.end && stack.last!.start >= range.start {
                stack.removeLast()
            }
            
            if !stack.isEmpty && stack.last!.end > range.start {
                stack.append((stack.last!.end, range.end))
            } else {
                stack.append(range)
            }
        }
        
        print(stack.count)
    }
}
