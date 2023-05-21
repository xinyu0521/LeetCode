//
//  硬件产品销售方案.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func yingjianxiaoshoufangan() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let amount = Int(line1)!
        let prices = try! JSONDecoder().decode(Array<Int>.self, from: line2.data(using: .utf8)!)
        let n = prices.count
        var ans: [[Int]] = []
        
        func backtracking(_ begin: Int, _ sum: Int, _ path: [Int]) {
            if sum > amount {
                return
            }
            if sum == amount {
                ans.append(path)
                return
            }
            
            for i in begin ..< n {
                backtracking(i, sum + prices[i], path + [prices[i]])
            }
        }
        
        backtracking(0, 0, [])
        
        print(ans)
    }
}
