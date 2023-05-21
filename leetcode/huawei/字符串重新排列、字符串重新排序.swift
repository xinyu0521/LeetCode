//
//  字符串重新排列、字符串重新排序.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func zifuchuancchongxinpaxu() {
    while let line = readLine() {
        var words = line.split(separator: " ").map { String($0.sorted()) }
        let cnt = words.reduce(into: [String: Int]()) {
            $0[$1, default: 0] += 1
        }
        
        words.sort {
            if cnt[$0, default: 0] == cnt[$1, default: 0] {
                if $0.count == $1.count {
                    return $0 < $1
                }
                return $0.count < $1.count
            }
            return cnt[$0, default: 0] > cnt[$1, default: 0]
        }
        
        print(words.joined(separator: " "))
    }
}
