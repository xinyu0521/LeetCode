//
//  1184. 公交站间的距离.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/24.
//

import Foundation

func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
    let n = distance.count
    let distance = distance + distance
    
    let start1 = min(start, destination)
    let destination1 = max(start, destination)
    
    let start2 = destination1
    let destination2 = start1 + n
    
    let sum1 = distance[start1 ..< destination1].reduce(0) { $0 + $1 }
    let sum2 = distance[start2 ..< destination2].reduce(0) { $0 + $1 }
    
    return min(sum1, sum2)
}
