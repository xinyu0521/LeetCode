//
//  1832. 判断句子是否为全字母句.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/13.
//

import Foundation

func checkIfPangram(_ sentence: String) -> Bool {
    !sentence.reduce(into: Array(repeating: 0, count: 26)) {
        $0[Int($1.asciiValue!) - 97] += 1
    }.contains(0)
}
