//
//   打印机队列.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func dayinjiduilie() {
    while let line = readLine() {
        let n = Int(line)!
        var map: [Int: Heap<[Int]>] = [:]
        for i in 1 ... 5 {
            map[i] = Heap<[Int]>(elements: [], sort: { $0[0] > $1[0] })
        }
        
        for i in 0 ..< n {
            if let line = readLine() {
                let strs = line.split(separator: " ")
                let op = strs[0]
                let p = Int(strs[1])!
                
                if op == "IN" {
                    let num = Int(strs[2])!
                    map[p]?.insert([num, i + 1])
                } else {
                    if map[p]!.isEmpty {
                        print("NULL")
                    } else {
                        print(map[p]!.remove()![1])
                    }
                }
            }
        }
    }
}
