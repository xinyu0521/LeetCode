//
//  垃圾短信识别.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func duanxinshibie() {
    while let line = readLine() {
        let n = Int(line)!
        
        var sendPersons: Set<Int> = []
        var recivePersons: Set<Int> = []
        var sendCount = 0
        var reciveCount = 0
        var sendToA: [Int: Int] = [:]
        var reciveFromA: [Int: Int] = [:]
        
        var pairs: [[Int]] = []
        
        for _ in 0 ..< n {
            if let line = readLine() {
                let pair = line.split(separator: " ").map { Int($0)! }
                pairs.append(pair)
            }
        }
        
        if let line = readLine() {
            let id = Int(line)!
            
            for pair in pairs {
                let s = pair[0]
                let r = pair[1]
                
                if s == id {
                    sendPersons.insert(r)
                    sendCount += 1
                    reciveFromA[r, default: 0] += 1
                }
                
                if r == id {
                    recivePersons.insert(s)
                    reciveCount += 1
                    sendToA[s, default: 0] += 1
                }
            }
        }
        
        var l = 0
        for p in sendPersons {
            if !recivePersons.contains(p) {
                l += 1
            }
        }
        
        let m = sendCount - reciveCount
        
        var N = false
        for (key, val) in reciveFromA {
            if val - sendToA[key, default: 0] > 5 {
                N = true
                break
            }
        }
        
        if l > 5 || m > 10 || N {
            print("false \(l) \(m)")
        } else {
            print("true \(l) \(m)")
        }
    }
}
