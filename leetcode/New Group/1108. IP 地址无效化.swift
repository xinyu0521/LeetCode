//
//  1108. IP 地址无效化.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/21.
//

import Foundation

func defangIPaddr(_ address: String) -> String {
//    var ans: [Character] = []
//    for c in Array(address) {
//        if c == "." {
//            ans.append(contentsOf: ["[", ".", "]"])
//            continue
//        }
//        ans.append(c)
//    }
//    return String(ans)
    address.replacingOccurrences(of: ".", with: "[.]")
}
