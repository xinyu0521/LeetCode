//
//  467. 环绕字符串中唯一的子字符串.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/25.
//

import Foundation

func findSubstringInWraproundString(_ p: String) -> Int {
    var dp: [Int] = Array(repeating: 0, count: 26)
    var k = 0
    let chars = Array(p)
    
    for i in 0 ..< chars.count {
        let index = Int(chars[i].asciiValue!)
        if i > 0,
            (index - Int(chars[i - 1].asciiValue!) == 1 ||
             index - Int(chars[i - 1].asciiValue!) == -25) {
            k += 1
        } else {
            k = 1
        }
        
        dp[index - 97] = max(dp[index - 97], k)
    }
    
    var ans = 0
    for i in dp {
        ans += i
    }
    
    return ans
}
