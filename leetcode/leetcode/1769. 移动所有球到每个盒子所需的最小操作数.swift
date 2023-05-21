//
//  1769. 移动所有球到每个盒子所需的最小操作数.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/2.
//

import Foundation

func minOperations(_ boxes: String) -> [Int] {
    var sum = 0
    var presums: [Int] = []
    var ans: [Int] = Array(repeating: 0, count: boxes.count)
    let chars = Array(boxes)
    
    for i in chars.indices {
        presums.append(sum)
        if chars[i] == "1" {
            sum += 1
            if i != 0 {
                ans[0] += i
            }
        }
    }
    
    for i in 1 ..< chars.count {
        ans[i] = ans[i - 1] + presums[i] - (sum - presums[i])
    }
    
    return ans
}
