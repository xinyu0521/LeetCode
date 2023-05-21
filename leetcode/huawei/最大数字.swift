//
//  最大数字.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func zuidashuzi() {
    while let line = readLine() {
        let nums = line.map { Int(String($0))! }
        var cnt = nums.reduce(into: [Int: Int]()) {
            $0[$1, default: 0] += 1
        }
        var reserve: [Int: Int] = [:]
        var stack: [Int] = []
        for num in nums {
            if reserve[num, default: 0] == 2 {
                cnt[num, default: 0] -= 1
                continue
            }
            while !stack.isEmpty,
                  stack.last! < num,
                  reserve[stack.last!, default: 0] + cnt[stack.last!, default: 0] > 2 {
                let top = stack.removeLast()
                reserve[top, default: 0] -= 1
            }
            stack.append(num)
            reserve[num, default: 0] += 1
            cnt[num, default: 0] -= 1
        }
        
        stack.forEach {
            print($0, terminator: "")
        }
    }
}
