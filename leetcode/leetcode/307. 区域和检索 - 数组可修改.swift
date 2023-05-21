//
//  307. 区域和检索 - 数组可修改.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/4.
//

import Foundation


//class NumArray {
//
//    let tree: FenwickTree
//    var nums: [Int]
//
//    init(_ nums: [Int]) {
//        self.nums = nums
//        tree = FenwickTree(nums.count + 1)
//        for i in 0 ..< nums.count {
//            tree.update(i + 1, nums[i])
//        }
//    }
//
//    func update(_ index: Int, _ val: Int) {
//        tree.update(index + 1, val - nums[index])
//        nums[index] = val
//    }
//
//    func sumRange(_ left: Int, _ right: Int) -> Int {
//        return tree.query(right + 1) - tree.query(left)
//    }
//}

class NumArray {
    
    let segmentTree: SegmentTree<Int>
    
    init(_ nums: [Int]) {
        segmentTree = SegmentTree(nums) {
            $0 + $1
        }
    }
    
    func update(_ index: Int, _ val: Int) {
        segmentTree.update(index, val)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        segmentTree.query(left, right)
    }
}

