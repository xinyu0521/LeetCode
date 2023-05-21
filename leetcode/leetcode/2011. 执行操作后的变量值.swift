//
//  2011. 执行操作后的变量值.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/23.
//

import Foundation

func finalValueAfterOperations(_ operations: [String]) -> Int {
    var ans = 0
    
    for operation in operations {
        if operation == "X++" || operation == "++X" {
            ans += 1
        } else {
            ans -= 1
        }
    }
    
    return ans
}
