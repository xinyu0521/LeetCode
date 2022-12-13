//
//  738. 单调递增的数字.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/10.
//

import Foundation

func monotoneIncreasingDigits(_ n: Int) -> Int {
    var tmp = n
    var nums: [Int] = []
    while tmp > 0 {
        nums.append(tmp % 10)
        tmp /= 10
    }
    nums.reverse()
    var index = nums.count
    for i in nums.indices.dropFirst().reversed() {
        if nums[i] < nums[i - 1] {
            index = i
            nums[i - 1] -= 1
        }
    }
    
    for i in index ..< nums.count {
        nums[i] = 9
    }
    
    return nums.reduce(0) {
        $0 * 10 + $1
    }
}
