//
//  1792. 最大平均通过率.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/19.
//

import Foundation

func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
    var heap = Heap(elements: classes) {
        Double($0[0] + 1) / Double($0[1] + 1) - (Double($0[0]) / Double($0[1])) > Double($1[0] + 1) / Double($1[1] + 1) - (Double($1[0]) / Double($1[1]))
    }
    
    var extra = extraStudents
    while extra > 0 {
        if var cla = heap.remove() {
            cla[0] += 1
            cla[1] += 1
            heap.insert(cla)
        }
        extra -= 1
    }
    
    var total: Double = 0
    heap.elements.forEach {
        total += Double($0[0]) / Double($0[1])
    }
    
    return total / Double(heap.count)
}
