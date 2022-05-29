//
//  468. 验证IP地址.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/29.
//

import Foundation

func validIPAddress(_ queryIP: String) -> String {
    var items = queryIP.split(separator: ".", omittingEmptySubsequences: false)
    if items.count == 4 {
        for item in items {
            if item.isEmpty { return "Neither" }
            let chars = Array(item)
            if chars.count > 3 { return "Neither" }
            if chars.count > 1, chars[0] == "0" { return "Neither" }
            for char in chars where !("0" ... "9").contains(char) { return "Neither" }
            if Int(item)! > 255 { return "Neither" }
        }
        return "IPv4"
    }

    items = queryIP.split(separator: ":", omittingEmptySubsequences: false)

    if items.count == 8 {
        for item in items {
            if item.isEmpty { return "Neither" }
            let chars = Array(item)
            if chars.count > 4 { return "Neither" }
            for char in chars where
                !("0" ... "9").contains(char) &&
                !("a" ... "f").contains(char) &&
                !("A" ... "F").contains(char)
            {
                return "Neither"
            }
        }
        return "IPv6"
    }

    return "Neither"
}
