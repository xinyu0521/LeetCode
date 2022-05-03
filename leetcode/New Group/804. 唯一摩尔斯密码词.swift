//
//  804. 唯一摩尔斯密码词.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func uniqueMorseRepresentations(_ words: [String]) -> Int {
    var res: Set<String> = []
    let list = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]

    for word in words {
        var str = ""
        for c in word {
            str.append(list[Int(c.asciiValue!) - 97])
        }
        res.insert(str)
    }

    return res.count
}
