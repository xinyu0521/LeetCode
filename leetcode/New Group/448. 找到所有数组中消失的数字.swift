//
//  448. 找到所有数组中消失的数字.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/19.
//

import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    let cnt = nums.reduce(into: Array(repeating: false, count: nums.count + 1)) {
        $0[$1] = true
    }
    
    return zip(cnt.indices, cnt).reduce(into: [Int]()) {
        if $1.1 == false,
           $1.0 != 0 {
            $0.append($1.0)
        }
    }
}

// 空间复杂度O(1)
func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
    var nums = nums
    for num in nums {
        nums[num - 1] = nums[num - 1] > 0 ? -nums[num - 1] : nums[num - 1]
    }
    return nums.indices.reduce(into: [Int]()) {
        if nums[$1] < 0 {
            $0.append($1 + 1)
        }
    }
}
