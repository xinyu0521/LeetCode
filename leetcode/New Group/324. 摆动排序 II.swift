//
//  324. 摆动排序 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/28.
//

import Foundation

func wiggleSort(_ nums: inout [Int]) {
    let arr = nums.sorted(by: <)
    let n = arr.count
    let x = (n + 1) / 2
    var j = x - 1
    var k = n - 1
    for i in stride(from: 0, to: n, by: 2) {
        nums[i] = arr[j]
        if i + 1 < n {
            nums[i + 1] = arr[k]
        }
        j -= 1
        k -= 1
    }
}

//1234 5 6789
//173956284
//
//
//1234 5678
//1638 5274
