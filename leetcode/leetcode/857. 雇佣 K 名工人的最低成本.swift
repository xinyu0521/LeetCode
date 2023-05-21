//
//  857. 雇佣 K 名工人的最低成本.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/11.
//

import Foundation

func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
    let h = Array(0 ..< quality.count).sorted { a, b in
        quality[b] * wage[a] < quality[a] * wage[b]
    }
    
    var res: Double = 1e9
    var totalq: Double = 0.0
    var pq = Heap<Int>(elements: [], sort: { $0 > $1 })
    
    for i in 0 ..< k - 1 {
        totalq += Double(quality[h[i]])
        pq.insert(quality[h[i]])
    }
    
    for i in k - 1 ..< quality.count {
        let index = h[i]
        totalq += Double(quality[index])
        pq.insert(quality[index])
        let totalc: Double = Double(wage[index]) / Double(quality[index]) * totalq
        res = min(res, totalc)
        totalq -= Double(pq.remove()!)
    }
    
    return res
}
