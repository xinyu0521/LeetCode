//
//  对称美学.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func duichenmeixue() {
    while let line = readLine() {
        let n = Int(line)!
        
        for _ in 0 ..< n {
            if let line = readLine() {
                let nk = line.split(separator: " ").map { Int($0)! }
                print(getColor(nk[0], nk[1]))
            }
        }
        
        func getColor(_ n: Int, _ k: Int) -> String {
            if n == 1 {
                return "red"
            }
            if n == 2 {
                return k == 0 ? "blue" : "red"
            }
            
            if k < n / 2 {
                return getColor(n - 1, k) == "red" ? "blue" : "red"
            } else {
                return getColor(n - 1, k - (1 << (n - 2)))
            }
        }
    }
}
