//
//  1663. 具有给定数值的最小字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/26.
//

import Foundation

func getSmallestString(_ n: Int, _ k: Int) -> String {
    var ans = Array(repeating: 0, count: n)
    var k = k
    for i in (0 ..< n).reversed() {
        if k - i >= 26 {
            ans[i] = 26
        } else {
            ans[i] = k - i
        }
        k = k - ans[i]
    }
    
    let chars = ans.map {
        Character(UnicodeScalar($0 + 96)!)
    }

    return String(chars)
}
