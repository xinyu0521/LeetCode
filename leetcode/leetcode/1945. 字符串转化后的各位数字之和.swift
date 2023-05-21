//
//  1945. 字符串转化后的各位数字之和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/15.
//

import Foundation

func getLucky(_ s: String, _ k: Int) -> Int {
    var ans = s.reduce("") { $0 + String($1.asciiValue! - 97 + 1) }
    
    for _ in 0 ..< k {
        ans = String(ans.reduce(0) { $0 + $1.wholeNumberValue! })
    }
    
    return Int(ans)!
}
