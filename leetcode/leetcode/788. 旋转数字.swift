//
//  788. 旋转数字.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/25.
//

import Foundation

func rotatedDigits(_ n: Int) -> Int {
    var res = 0
    all: for i in 1 ... n {
        var ok = false
        var x = i
        while x != 0 {
            let t = x % 10
            x = x / 10
            if t == 2 || t == 5 || t == 6 || t == 9 {
                ok = true
            } else if t != 0, t != 1, t != 8 {
                continue all
            }
        }
        if ok {
            res += 1
        }
    }
    return res
}
