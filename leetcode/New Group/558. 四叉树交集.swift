//
//  558. 四叉树交集.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/15.
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

fileprivate func intersect(_ quadTree1: Node?, _ quadTree2: Node?) -> Node? {
    guard let quadTree1 = quadTree1 else {
        return quadTree2
    }
    
    guard let quadTree2 = quadTree2 else {
        return quadTree1
    }
    
    if quadTree1.isLeaf {
        if quadTree1.val {
            return Node(true, true)
        }
        else {
            return quadTree2
        }
    }
    
    if quadTree2.isLeaf {
        return intersect(quadTree2, quadTree1)
    }
    
    let topLeft = intersect(quadTree1.topLeft, quadTree2.topLeft)
    let topRight = intersect(quadTree1.topRight, quadTree2.topRight)
    let bottomLeft = intersect(quadTree1.bottomLeft, quadTree2.bottomLeft)
    let bottomRight = intersect(quadTree1.bottomRight, quadTree2.bottomRight)
    
    if topLeft?.isLeaf == true,
       topRight?.isLeaf == true,
       bottomLeft?.isLeaf == true,
       bottomRight?.isLeaf == true,
       topLeft?.val == topRight?.val,
       topRight?.val == bottomLeft?.val,
       bottomLeft?.val == bottomRight?.val {
        return Node(topLeft!.val, true)
    }
    
    let node =  Node(false, false)
    node.topLeft = topLeft
    node.topRight = topRight
    node.bottomLeft = bottomLeft
    node.bottomRight = bottomRight
    
    return node
}
