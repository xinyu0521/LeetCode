//
//  241. 为运算表达式设计优先级.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/1.
//

import Foundation

fileprivate enum Op {
    static let add = -1
    static let sub = -2
    static let multi = -3
}

func diffWaysToCompute(_ expression: String) -> [Int] {
    var ops: [Int] = []
    let expression = Array(expression)
    let n = expression.count
    var i = 0
    while i < n {
        let c = expression[i]
        if c.isNumber {
            var num = 0
            while i < n, expression[i].isNumber {
                num = num * 10 + Int(String(expression[i]))!
                i += 1
            }
            ops.append(num)
        } else {
            if c == "+" {
                ops.append(Op.add)
            } else if c == "-" {
                ops.append(Op.sub)
            } else {
                ops.append(Op.multi)
            }
            i += 1
        }
    }
    
    var dp = Array(repeating: Array(repeating: [Int](), count: ops.count), count: ops.count)
    
    func dfs(_ l: Int, _ r: Int) -> [Int] {
        if !dp[l][r].isEmpty {
            return dp[l][r]
        }
        
        if l == r {
            dp[l][r].append(ops[l])
        } else {
            for i in stride(from: l, to: r, by: 2) {
                let left = dfs(l, i)
                let right = dfs(i + 2, r)
                
                for lv in left {
                    for rv in right {
                        if ops[i + 1] == Op.add {
                            dp[l][r].append(lv + rv)
                        } else if ops[i + 1] == Op.sub {
                            dp[l][r].append(lv - rv)
                        } else {
                            dp[l][r].append(lv * rv)
                        }
                    }
                }
            }
        }
        
        return dp[l][r]
    }
    
    return dfs(0, ops.count - 1)
}
