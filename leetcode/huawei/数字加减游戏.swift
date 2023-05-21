//
//  数字加减游戏.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func shuzijiajian() {
    while let line = readLine() {
        let stab = line.split(separator: " ").map { Int($0)! }
        let s = stab[0]
        let t = stab[1]
        let a = stab[2]
        let b = stab[3]
        
        let diff = t - s
        var x = 0
        
        while (diff - x * a) % b != 0 && (diff + x * a) % b != 0 {
            x += 1
        }
        
        print(abs(x))
    }
}
