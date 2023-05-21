//
//  2325. 解密消息.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/1.
//

import Foundation

func decodeMessage(_ key: String, _ message: String) -> String {
    var map: [Character: Character] = [:]
    var v: Character = "a"
    for k in key {
        if k == " " || map[k] != nil {
            continue
        }
        
        map[k] = v
        v = Character(UnicodeScalar(v.asciiValue! + 1))
    }
    return String(message.map {
        if $0 == " " {
            return " "
        } else {
            return map[$0]!
        }
    })
}
