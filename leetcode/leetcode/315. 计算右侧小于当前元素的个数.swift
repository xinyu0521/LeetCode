//
//  315. 计算右侧小于当前元素的个数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/1.
//

import Foundation

func countSmaller(_ nums: [Int]) -> [Int] {
    let set = Set(nums).sorted()
    var ranks: [Int: Int] = [:]
    var rank = 1
    for num in set {
        ranks[num] = rank
        rank += 1
    }
    
    let tree = FenwickTree(nums.count + 1)
    var ans: [Int] = []
    
    for num in nums.reversed() {
        ans.append(tree.query(ranks[num]! - 1))
        tree.update(ranks[num]!, 1)
    }
    
    return ans.reversed()
}
