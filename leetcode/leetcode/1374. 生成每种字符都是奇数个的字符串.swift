//
//  1374. 生成每种字符都是奇数个的字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/1.
//

import Foundation

func generateTheString(_ n: Int) -> String {
    if n % 2 == 0 {
        return String(Array(repeating: "a", count: n - 1)) + "b"
    }
    return String(Array(repeating: "a", count: n))
}
