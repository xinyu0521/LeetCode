//
//  128. 最长连续序列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    let set = Set(nums)
    var ans = 0
    var curlength = 0
    for num in set {
        if set.contains(num - 1) {
            continue
        }
        
        curlength += 1
        var tmp = num + 1
        while set.contains(tmp) {
            curlength += 1
            tmp += 1
        }
        
        ans = max(ans, curlength)
        curlength = 0
    }
    return ans
}
