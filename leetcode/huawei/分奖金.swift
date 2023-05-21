//
//  分奖金.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func fenjiangjin() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let n = Int(line1)!
        let nums = line2.split(separator: " ").map { Int($0)! }
        var stack: [(index: Int, value: Int)] = []
        var ans = Array(repeating: 0, count: n)
        
        for i in nums.indices {
            let num = nums[i]
            while !stack.isEmpty && stack.last!.value < num {
                let top = stack.removeLast()
                ans[top.index] = (num - top.value) * (i - top.index)
            }
            stack.append((i, num))
        }
        
        stack.forEach {
            ans[$0.index] = $0.value
        }
        
        print(ans, separator: " ")
    }
}
