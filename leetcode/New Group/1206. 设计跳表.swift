//
//  1206. 设计跳表.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/27.
//

import Foundation

fileprivate class Node {
    let val: Int
    var forward: [Node?]
    init(_ val: Int, _ level: Int) {
        self.val = val
        forward = Array(repeating: nil, count: level)
    }
}

class Skiplist {
    
    static let maxLevel = 32
    static let pFactor = 0.25
    private let head: Node
    private var level: Int
    
    init() {
        head = Node(-1, Self.maxLevel)
        level = 0
    }
    
    func search(_ target: Int) -> Bool {
        var cur = head
        for i in (0 ..< Self.maxLevel).reversed() {
            while cur.forward[i] != nil,
                  cur.forward[i]!.val < target
            {
                cur = cur.forward[i]!
            }
        }
        if cur.forward[0] != nil,
           cur.forward[0]!.val == target
        {
            return true
        }
        return false
    }
    
    func add(_ num: Int) {
        var update: [Node?] = Array(
            repeating: nil,
            count: Self.maxLevel
        )
        var cur = head
        for i in (0 ..< Self.maxLevel).reversed() {
            while cur.forward[i] != nil,
                  cur.forward[i]!.val < num
            {
                cur = cur.forward[i]!
            }
            update[i] = cur
        }
        
        let lv = randomLevel()
        level = max(level, lv)
        let newNode = Node(num, lv)
        for i in 0 ..< lv {
            newNode.forward[i] = update[i]?.forward[i]
            update[i]?.forward[i] = newNode
        }
    }
    
    func erase(_ num: Int) -> Bool {
        var update: [Node?] = Array(
            repeating: nil,
            count: Self.maxLevel
        )
        var cur = head
        for i in (0 ..< Self.maxLevel).reversed() {
            while cur.forward[i] != nil,
                  cur.forward[i]!.val < num
            {
                cur = cur.forward[i]!
            }
            update[i] = cur
        }
        
        guard let current = cur.forward[0],
              current.val == num else
        {
            return false
        }
        
        for i in 0 ..< level {
            if update[i]?.forward[i] !== current {
                break
            }
            
            update[i]?.forward[i] = current.forward[i]
        }
        
        while level > 1,
              head.forward[level - 1] == nil {
            level -= 1
        }
        return true
    }
    
    func randomLevel() -> Int {
        var lv = 1
        while Double.random(in: 0...1) < Self.pFactor,
              lv < Self.maxLevel {
            lv += 1
        }
        return lv
    }
}
