//
//  Queue.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/10.
//

import Foundation

struct Queue<E> {
    private var left: [E] = []
    private var right: [E] = []
    
    mutating func enqueue(_ element: E) {
        right.append(element)
    }
    
    mutating func dequeue() -> E? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

extension Queue: Collection {
    public var startIndex: Int { 0 }
    public var endIndex: Int { left.count + right.count }
    
    public func index(after i: Int) -> Int { i + 1 }
    public subscript(position: Int) -> E {
        position < left.count ? left[left.count - position - 1] : right[position - left.count]
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: E...) {
        self.init(left: elements.reversed(), right: [])
    }
}
