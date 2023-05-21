//
//  二进制差异数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func erjinzhichayishu() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let n = Int(line1)!
        let nums = line2.split(separator: " ").map { Int($0)! }
        var hightCnt = Array(repeating: 0, count: 60)
        
        for num in nums {
            var a = num
            var i = 0
            while a > 0 {
                a = a >> 1
                i += 1
            }
            hightCnt[i - 1] += 1
        }
        
        var ans = 0
        for i in 0 ..< hightCnt.count {
            for j in i + 1 ..< hightCnt.count {
                ans += hightCnt[i] * hightCnt[j]
            }
        }
        
        print(ans)
    }
}
