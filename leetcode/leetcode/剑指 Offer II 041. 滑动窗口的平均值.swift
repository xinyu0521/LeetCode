//
//  剑指 Offer II 041. 滑动窗口的平均值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/16.
//

import Foundation

class MovingAverage {
    
    let size: Int
    var values: ArraySlice<Int>
    var sum = 0

    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.size = size
        values = []
    }
    
    func next(_ val: Int) -> Double {
        sum += val
        values.append(val)
        if values.count > size {
            sum -= values.removeFirst()
        } else {
            return Double(sum) / Double(values.count)
        }
        return Double(sum) / Double(size)
    }
}
