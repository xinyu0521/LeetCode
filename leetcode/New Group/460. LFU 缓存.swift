//
//  460. LFU 缓存.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/20.
//

import Foundation

class CacheNode {
    var key: Int
    var val: Int
    var level: Int
    var next: CacheNode?
    var prev: CacheNode?
    init() {
        self.val = 0
        self.key = 0
        self.level = 0
        self.next = nil
        self.prev = nil
    }
}

class LevelLink {
    var head: CacheNode
    var tail: CacheNode
    
    init() {
        let node = CacheNode()
        node.val = -1
        head = node
        tail = node
    }
}

class LFUCache {
    
    var list: [LevelLink] = []
    var map: [Int: CacheNode] = [:]
    let capacity: Int
    var count = 0
    var minLevel = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        for _ in 0 ..< capacity {
            list.append(LevelLink())
        }
    }
    
    func get(_ key: Int) -> Int {
        if capacity == 0 { return -1 }
        
        guard let node = map[key] else {
            return -1
        }
        
        update(node)
        
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        
        if capacity == 0 { return }
        
        if let node = map[key] {
            node.val = value
            update(node)
            return
        }
        
        if count == capacity {
            let link = list[minLevel]
            map.removeValue(forKey: link.tail.key)
            let node = link.tail
            link.tail = link.tail.prev!
            link.tail.next = nil
            count -= 1
            
            let curLink = list[node.level]
            if curLink.head === curLink.tail, minLevel == node.level {
                minLevel += 1
            }
        }
        
        let node = CacheNode()
        node.key = key
        node.val = value
        node.level = 0
        
        let link = list[0]
        node.next = link.head.next
        node.next?.prev = node
        node.prev = link.head
        link.head.next = node
        
        if link.head === link.tail {
            link.tail = node
        }
        
        map[key] = node
        
        minLevel = 0
        count += 1
    }
    
    func update(_ node: CacheNode) {
        
        let curLink = list[node.level]
        
        if curLink.tail === node {
            curLink.tail = curLink.tail.prev!
        }
        
        if curLink.head === curLink.tail, minLevel == node.level, minLevel < list.count - 1 {
            minLevel += 1
        }
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        node.level += 1
        if node.level >= capacity {
            node.level = capacity - 1
        }
        let link = list[node.level]
        
        node.next = link.head.next
        node.next?.prev = node
        node.prev = link.head
        link.head.next = node
        
        if link.head === link.tail {
            link.tail = node
        }
    }
}
