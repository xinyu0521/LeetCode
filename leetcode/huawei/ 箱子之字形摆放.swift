//
//   箱子之字形摆放.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func xiangzibaifang() {
    while let line = readLine() {
        let strs = line.split(separator: " ")
        let chars = Array(strs[0])
        let n = chars.count
        let w = Int(strs[1])!
        var ans = Array(repeating: [Character](), count: w)
        
        var i = 0
        var range = Array(0 ..< w)
        
        while i < n {
            for j in range where i < n {
                ans[j].append(chars[i])
                i += 1
            }
            range.reverse()
        }
        
        for cs in ans {
            print(String(cs))
        }
    }
}
