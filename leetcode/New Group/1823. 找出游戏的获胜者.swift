//
//  1823. 找出游戏的获胜者.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/4.
//

import Foundation

func findTheWinner(_ n: Int, _ k: Int) -> Int {
    if n <= 1 { return n }
    let ans = (findTheWinner(n - 1, k) + k) % n
    return ans == 0 ? n : ans
}

