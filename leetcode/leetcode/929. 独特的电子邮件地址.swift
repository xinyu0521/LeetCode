//
//  929. 独特的电子邮件地址.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/4.
//

import Foundation

func numUniqueEmails(_ emails: [String]) -> Int {
    var set: Set<String> = []

    for email in emails {
        let strs = email.split(separator: "@")
        var local = ""
        for c in Array(strs[0]) where c != "." {
            if c == "+" { break }
            local.append(c)
        }
        set.insert(local + "@" + strs[1])
    }

    return set.count
}
