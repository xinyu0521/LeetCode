//
//  231. 2 的幂.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/12.
//

import Foundation

func isPowerOfTwo(_ n: Int) -> Bool {
    n == (n & -n)
}
