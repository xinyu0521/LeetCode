//
//  1652. 拆炸弹.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/24.
//

import Foundation

func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    if k == 0 { return Array(repeating: 0, count: code.count) }
    var res: [Int] = []
    let n = code.count
    var code = code + code
    if k > 0 {
        for i in 0 ..< n {
            let sum = (1 ... k).reduce(into: 0) { $0 += code[$1 + i] }
            res.append(sum)
        }
    } else {
        for i in 0 ..< n {
            let sum = (1 ... abs(k)).reduce(into: 0) { $0 += code[n + i - $1] }
            res.append(sum)
        }
    }
    return res
}
