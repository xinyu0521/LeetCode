//
//  779. 第K个语法符号.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/20.
//

import Foundation

func kthGrammar(_ n: Int, _ k: Int) -> Int {
    if n == 1 { return 0 }
    if k <= (1 << (n - 2)) {
        return kthGrammar(n - 1, k)
    }
    return kthGrammar(n - 1, k - (1 << (n - 2))) ^ 1
}
