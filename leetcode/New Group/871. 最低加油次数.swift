//
//  871. 最低加油次数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/2.
//

import Foundation

func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
    var fuel = startFuel
    var curLocation = 0
    var i = 0
    let n = stations.count
    var res = 0
    var heap = Heap<Int>(sort: >, elements: [])
    
    while fuel + curLocation < target {
        var newLocation = curLocation
        var add = false
        while i < n, stations[i][0] - curLocation <= fuel {
            if heap.isEmpty || stations[i][1] > heap.peek()! {
                newLocation = stations[0][1]
            }
            heap.insert(stations[i][1])
            add = true
            i += 1
        }
        
        if !add {
            guard let f = heap.remove() else {
                return -1
            }
            fuel += f
            res += 1
            continue
        }
        
        let f = heap.remove()!
        fuel += f
        fuel -= (newLocation - curLocation)
        curLocation = newLocation
        res += 1
    }
    
    return res
}
