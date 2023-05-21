//
//  670. 最大交换.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/13.
//

import Foundation

func maximumSwap(_ num: Int) -> Int {
    var chars = Array(String(num))
    var maxIndex = chars.count - 1
    var index1 = -1
    var index2 = -1
    for i in (0 ..< chars.count).reversed() {
        if chars[i] > chars[maxIndex] {
            maxIndex = i
        } else if chars[i] < chars[maxIndex] {
            index1 = i
            index2 = maxIndex
        }
    }
    
    if index1 >= 0 {
        chars.swapAt(index1, index2)
        return Int(String(chars))!
    }
    
    return num
}
