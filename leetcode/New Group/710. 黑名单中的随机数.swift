//
//  710. 黑名单中的随机数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/26.
//

import Foundation

class Solution710 {
    
    let bound: Int
    var white: [Int: Int] = [:]
    var blackSet: Set<Int> = []
    
    init(_ n: Int, _ blacklist: [Int]) {
        bound = n - blacklist.count
        for b in blacklist where b >= bound {
            blackSet.insert(b)
        }
        
        var w = bound
        for b in blacklist where b < bound {
            while blackSet.contains(w) {
                w += 1
            }
            white[b] = w
            w += 1
        }
    }
    
    func pick() -> Int {
        let x = Int.random(in: 0 ..< bound)
        return white[x] ?? x
    }
}
