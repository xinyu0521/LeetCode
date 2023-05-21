//
//  简单的解压缩算法.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func jiandandejieyasuanfa() {
    while let line = readLine() {
        let chars = Array(line)
        let n = chars.count
        var stack: [Character] = []
        
        var i = 0
        while i < n {
            let c = chars[i]
            
            if c == "{" {
                stack.append(c)
            } else if c == "}" {
                i += 1
                let j = i
                while i < n && chars[i].isNumber {
                    i += 1
                }
                i -= 1
                let n = Int(String(chars[j ... i]))!
                var subChars: [Character] = []
                while !stack.isEmpty && stack.last! != "{" {
                    subChars.append(stack.removeLast())
                }
                stack.removeLast()
                for _ in 0 ..< n {
                    stack.append(contentsOf: subChars.reversed())
                }
            } else if c.isLetter {
                stack.append(c)
            } else {
                let j = i
                while i < n && chars[i].isNumber {
                    i += 1
                }
                i -= 1
                let n = Int(String(chars[j ... i]))!
                let top = stack.removeLast()
                for _ in 0 ..< n {
                    stack.append(top)
                }
            }
            
            i += 1
        }
        
        print(String(stack))
    }
}
