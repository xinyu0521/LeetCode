//
//  FenwickTree.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/4.
//

import Foundation

class FenwickTree {
    var tree: [Int]
    init(_ capacity: Int) {
        tree = Array(repeating: 0, count: capacity)
    }

    func update(_ i: Int, _ delta: Int) {
        var index = i
        while index < tree.count {
            tree[index] += delta
            index += Self.lowbit(index)
        }
    }

    func query(_ i: Int) -> Int {
        var index = i
        var sum = 0
        while index > 0 {
            sum += tree[index]
            index -= Self.lowbit(index)
        }
        return sum
    }

    static func lowbit(_ i: Int) -> Int {
        return i & -i
    }
}
