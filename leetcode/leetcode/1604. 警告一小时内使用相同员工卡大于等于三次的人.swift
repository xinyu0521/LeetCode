//
//  1604. 警告一小时内使用相同员工卡大于等于三次的人.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/7.
//

import Foundation

func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
    Array(
        zip(keyName, keyTime)
            .reduce(into: [String: [Int]]()) {
                let hm = $1.1.split(separator: ":")
                $0[$1.0, default: []].append(Int(hm[0])! * 60 + Int(hm[1])!)
            }
            .reduce(into: Set<String>()) {
                let times = $1.value.sorted()
                if times.count > 2 {
                    for i in 2 ..< times.count {
                        if times[i] - times[i - 2] <= 60 {
                            $0.insert($1.key)
                        }
                    }
                }
            }
    ).sorted()
}
