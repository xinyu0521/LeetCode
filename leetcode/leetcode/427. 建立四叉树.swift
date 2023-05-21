//
//  427. 建立四叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/29.
//

import Foundation

fileprivate class Node {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node?
    public var topRight: Node?
    public var bottomLeft: Node?
    public var bottomRight: Node?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = nil
        self.topRight = nil
        self.bottomLeft = nil
        self.bottomRight = nil
    }
}

fileprivate func construct(_ grid: [[Int]]) -> Node? {
    func dfs(r0: Int, c0: Int, r1: Int, c1: Int) -> Node? {
        let first = grid[r0][c0]
        var same = true
        all: for rows in grid[r0 ..< r1] {
            for val in rows[c0 ..< c1] where val != first {
                same = false
                break all
            }
        }

        if same {
            return Node(first == 1 ? true : false, true)
        }

        let root = Node(false, false)
        root.topLeft = dfs(r0: r0, c0: c0, r1: (r0 + r1) >> 1, c1: (c0 + c1) >> 1)
        root.topRight = dfs(r0: r0, c0: (c0 + c1) >> 1, r1: (r0 + r1) >> 1, c1: c1)
        root.bottomLeft = dfs(r0: (r0 + r1) >> 1, c0: c0, r1: r1, c1: (c0 + c1) >> 1)
        root.bottomRight = dfs(r0: (r0 + r1) >> 1, c0: (c0 + c1) >> 1, r1: r1, c1: c1)

        return root
    }

    return dfs(r0: 0, c0: 0, r1: grid.count, c1: grid.count)
}
