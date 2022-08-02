//
//  func fractionAddition(_ expression- String) -> String {      }.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/27.
//

import Foundation

func fractionAddition(_ expression: String) -> String {
    var denominator = 0
    var numerator = 1
    let chars = Array(expression)
    let n = chars.count
    var index = 0
    
    while index < n {
        var d1 = 0
        var sign = 1
        if chars[index] == "-" || chars[index] == "+" {
            sign = chars[index] == "-" ? -1 : 1
            index += 1
        }
        
        while index < n,
              chars[index].isNumber {
            d1 = d1 * 10 + Int(String(chars[index]))!
            index += 1
        }
        d1 = d1 * sign
        
        index += 1
        
        var n1 = 0
        while index < n,
              chars[index].isNumber {
            n1 = n1 * 10 + Int(String(chars[index]))!
            index += 1
        }
        
        denominator = denominator * n1 + d1 * numerator
        numerator = numerator * n1
    }
    
    if denominator == 0 {
        return "0/1"
    }
    
    let g = gcd(abs(denominator), numerator)
    return "\(denominator / g)/\(numerator / g)"
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    var remainder = a % b
    while remainder != 0 {
        a = b
        b = remainder
        remainder = a % b
    }
    return b
}
