//
//  386. 字典序排数.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/18.
//

import Foundation

func lexicalOrder(_ n: Int) -> [Int] {
    var res: [Int] = []
    func lexical(_ m: Int) {
        for i in 0 ..< 10 where m + i <= n && m + i > 0 {
            res.append(m + i)
            lexical((m + i) * 10)
        }
    }

    lexical(0)

    return res
}
