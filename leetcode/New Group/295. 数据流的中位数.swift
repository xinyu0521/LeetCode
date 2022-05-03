//
//  295. 数据流的中位数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/19.
//

import Foundation

class MedianFinder {
    
    var smallerHeap = Heap<Int>(sort: >, elements: [])
    var largerHeap = Heap<Int>(sort: <, elements: [])

    init() {
        
    }
    
    func addNum(_ num: Int) {
        
        if smallerHeap.isEmpty || num < smallerHeap.peek()! {
            smallerHeap.insert(num)
        } else {
            largerHeap.insert(num)
        }
        
        if smallerHeap.count < largerHeap.count {
            smallerHeap.insert(largerHeap.remove()!)
        } else if smallerHeap.count - largerHeap.count == 2 {
            largerHeap.insert(smallerHeap.remove()!)
        }
    }
    
    func findMedian() -> Double {
        if smallerHeap.count == largerHeap.count {
            return Double(smallerHeap.peek()! + largerHeap.peek()!) * 0.5
        } else {
            return Double(smallerHeap.peek()!)
        }
    }
}
