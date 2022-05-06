//
//  933. 最近的请求次数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/6.
//

import Foundation

class RecentCounter {
    
    var q = ArraySlice<Int>()

    init() {

    }
    
    func ping(_ t: Int) -> Int {
        while !q.isEmpty, q.first! < t - 3000 {
            q.removeFirst()
        }
        q.append(t)
        return q.count
    }
}
