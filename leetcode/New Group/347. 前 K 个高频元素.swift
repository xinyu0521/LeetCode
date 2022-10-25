//
//  347. 前 K 个高频元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/23.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for num in nums {
        map[num, default: 0] += 1
    }
    
    var heap = Array(repeating: (0, 0), count: k)
    
    for (num, count) in map where count > heap[0].0 {
        heap[0] = (count, num)
        shift()
    }
    
    func shift() {
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = 2 * i + 2
            if left >= k, right >= k {
                break
            }
            
            if right >= k {
                if heap[left].0 < heap[i].0 {
                    heap.swapAt(i, left)
                }
                break
            } else {
                var swapI = -1
                if heap[left].0 < heap[i].0, heap[right].0 < heap[i].0 {
                    swapI = heap[left].0 < heap[right].0 ? left : right
                } else if heap[left].0 < heap[i].0 {
                    swapI = left
                } else if heap[right].0 < heap[i].0 {
                    swapI = right
                }
                
                if swapI == -1 { break }
                heap.swapAt(i, swapI)
                i = swapI
            }
        }
    }
    
    return heap.map { $1 }.sorted()
}
