//
//  1175. 质数排列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/30.
//

import Foundation

func numPrimeArrangements(_ n: Int) -> Int {
    let mod = 1000000007
    func isPrime(_ n: Int) -> Bool {
        if n == 1 { return false }
        var i = 2
        while i * i < n {
            if n % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
    
    func factorial(_ n: Int) -> Int {
        if n == 0 { return 1 }
        var res = 1
        for i in 1 ... n {
            res *= i
            res %= mod
        }
        return res
    }
    
    var m = 0
    for i in 1 ... n where isPrime(i) {
        m += 1
    }
    
    return factorial(m) * factorial(n - m) % mod
}
