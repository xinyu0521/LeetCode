//
//  1598. 文件夹操作日志搜集器.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/9.
//

import Foundation

func minOperations(_ logs: [String]) -> Int {
    logs.reduce(into: 0) {
        if $1 == "./" { return }
        if $1 == "../" {
            $0 = max(0, $0 - 1)
        } else {
            $0 += 1
        }
    }
}
