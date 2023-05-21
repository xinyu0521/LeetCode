//
//  1138. 字母板上的路径.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/12.
//

import Foundation

func alphabetBoardPath(_ target: String) -> String {
    var map: [Character: (x: Int, y: Int)] = [:]
    var n = 0
    for c in "abcdefghijklmnopqrstuvwxyz" {
        map[c] = (n % 5, n / 5)
        n += 1
    }
    
    var ans = ""
    var start = (x: 0, y: 0)
    for c in target {
        let end = map[c]!
        
        if end.y < start.y {
            ans += String(repeating: "U", count: start.y - end.y)
        }
        
        if end.x < start.x {
            ans += String(repeating: "L", count: start.x - end.x)
        }
        
        if end.y > start.y {
            ans += String(repeating: "D", count: end.y - start.y)
        }
        
        if end.x > start.x {
            ans += String(repeating: "R", count: end.x - start.x)
        }
        
        ans += "!"
        start = end
    }
    
    return ans
}
