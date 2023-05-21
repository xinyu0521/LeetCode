//
//  字符串解密.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func zifuchuanjiemi() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let chars = Array(line1)
        var str = ""
        var rightStrs: [String] = []
        let set: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", ]
        for c in chars {
            if set.contains(c) {
                if str.count > 0 {
                    rightStrs.append(str)
                    str = ""
                }
                continue
            } else {
                str.append(c)
            }
        }
        
        if str.count > 0 {
            rightStrs.append(str)
        }
        
        let limit = Set(Array(line2)).count
        
        let sorted = rightStrs.filter {
            Set(Array($0)).count <= limit
        }.sorted {
            if Set(Array($0)).count > Set(Array($1)).count {
                return true
            } else if Set(Array($0)).count == Set(Array($1)).count {
                return $0 > $1
            } else {
                return false
            }
        }
        
        print(sorted[0])
    }
}
