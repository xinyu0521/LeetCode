//
//  108. 将有序数组转换为二叉搜索树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/20.
//

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    func sort(_ begin: Int, _ end: Int) -> TreeNode? {
        if begin >= end { return nil }
        
        let mid = begin + (end - begin) / 2
        let root = TreeNode(nums[mid])
        root.left = sort(begin, mid)
        root.right = sort(mid + 1, end)
        
        return root
    }
    
    return sort(0, nums.count)
}
