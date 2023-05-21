//
//  1470. 重新排列数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/29.
//

import Foundation

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    zip(nums[0 ..< n], nums[n ..< 2 * n - 1]).reduce(into: [Int]()) {
        $0.append($1.0)
        $0.append($1.1)
    }
}
