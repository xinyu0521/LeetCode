//
//  883. 三维形体投影面积.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/26.
//

import Foundation

func projectionArea(_ grid: [[Int]]) -> Int {
    
    var xs = Array(repeating: 0, count: 50)
    var ys = Array(repeating: 0, count: 50)
    var zArea = 0
    
    for i in 0 ..< grid.count {
        let ycoords = grid[i]
        for j in 0 ..< ycoords.count {
            let val = ycoords[j]
            if val > 0 {
                zArea += 1
            }
            
            xs[i] = max(xs[i], val)
            ys[j] = max(ys[j], val)
            
        }
    }
    
    var ans = 0
    
    for i in 0 ..< 50 {
        ans += xs[i] + ys[i]
    }
    
    _ = xs.reduce(0, +)
    
    ans += zArea
    
    return ans
}
