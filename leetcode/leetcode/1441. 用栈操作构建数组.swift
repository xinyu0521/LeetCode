//
//  1441. 用栈操作构建数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/15.
//

import Foundation

func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var ans: [String] = []
    var index = 0
    for i in 1 ... target.last! {
        ans.append("Push")
        if i != target[index] {
            ans.append("Pop")
        } else {
            index += 1
        }
    }
    return ans
}
