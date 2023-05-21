//
//  去除多余空格.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func quchuduoyukongge() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let chars = Array(line1)
        var ranges = line2.split(separator: ",").map {
            $0.split(separator: " ").map { Int($0)! }
        }
        
        var flag = false
        var stack: [Character] = []
        var del: [Int] = []
        
        for i in chars.indices {
            let c = chars[i]
            
            if c == "'" {
                flag.toggle()
            }
            
            if flag {
                stack.append(c)
                continue
            }
            
            if c == " " && stack.last! == " " {
                    del.append(i)
                    continue
            }
            
            stack.append(c)
        }
        
        for d in del {
            for i in ranges.indices {
                if ranges[i][0] > d {
                    ranges[i][0] -= 1
                    ranges[i][1] -= 1
                }
            }
        }
        
        print(String(stack))
        for range in ranges {
            print("[\(range[0]), \(range[1])]", terminator: "")
        }
    }
}
