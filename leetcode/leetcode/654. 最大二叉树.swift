//
//  654. 最大二叉树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/18.
//

import Foundation

func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty { return nil }

    func makeBMT(_ begin: Int, _ end: Int) -> TreeNode? {
        if begin >= end { return nil }
        var maxIndex = 0
        var maxNum = Int.min
        for i in begin ..< end where nums[i] > maxNum {
            maxNum = nums[i]
            maxIndex = i
        }

        let root = TreeNode(nums[maxIndex])
        root.left = makeBMT(begin, maxIndex)
        root.right = makeBMT(maxIndex + 1, end)

        return root
    }

    return makeBMT(0, nums.count)
}
