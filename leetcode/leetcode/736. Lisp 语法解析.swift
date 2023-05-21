//
//  736. Lisp 语法解析.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/6.
//

import Foundation

func evaluate(_ expression: String) -> Int {
    var start = 0
    let expression = Array(expression)
    let n = expression.count
    var scope: [String: ArraySlice<Int>] = [:]
    
    func parseInt() -> Int {
        var res = 0
        var sign = 1
        
        if expression[start] == "-" {
            sign = -1
            start += 1
        }
        
        while start < n, expression[start].isNumber {
            res = res * 10 + Int(String(expression[start]))!
            start += 1
        }
        
        return res * sign
    }
    
    func parseVar() -> String {
        var res = ""
        
        while start < n,
              expression[start] != " ",
              expression[start] != ")" {
            res.append(expression[start])
            start += 1
        }
        
        return res
    }
    
    func innerEvaluate() -> Int {
        if expression[start] != "(" {
            if expression[start].isLowercase {
                let v = parseVar()
                return (scope[v]?.last)!
            } else {
                return parseInt()
            }
        }
        
        var res = 0
        start += 1
        
        if expression[start] == "l" {
            start += 4
            var vars: [String] = []
            
            while true {
                if !expression[start].isLowercase {
                    res = innerEvaluate()
                    break
                }
                
                let v = parseVar()
                
                if expression[start] == ")" {
                    res = (scope[v]?.last)!
                    break
                }
                
                vars.append(v)
                start += 1
                let e = innerEvaluate()
                if scope[v] == nil {
                    scope[v] = ArraySlice()
                }
                scope[v]?.append(e)
                start += 1
            }
            for v in vars {
                scope[v]?.popLast()
            }
        } else if expression[start] == "a" {
            start += 4
            let e1 = innerEvaluate()
            start += 1
            let e2 = innerEvaluate()
            res = e1 + e2
        } else {
            start += 5
            let e1 = innerEvaluate()
            start += 1
            let e2 = innerEvaluate()
            res = e1 * e2
        }
        
        start += 1
        return res
    }
    
    return innerEvaluate()
}
