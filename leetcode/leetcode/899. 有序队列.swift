//
//  899. 有序队列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/3.
//

import Foundation

func orderlyQueue(_ s: String, _ k: Int) -> String {
    if k == 1 {
        var small = s
        var chars = Array(s)
        for c in chars {
            chars.removeFirst()
            chars.append(c)
            small = min(small, String(chars))
        }
        return small
    } else {
        return String(Array(s).sorted())
    }
}
