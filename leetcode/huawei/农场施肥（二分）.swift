//
//  农场施肥.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func nongchangshifei() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let mn = line1.split(separator: " ").map { Int($0)! }
        let fields = line2.split(separator: " ").map { Int($0)! }
        let m = mn[0]
        let n = mn[1]
        
        if n < fields.count {
            print(-1)
            return
        }
        
        var l = 1
        var r = fields.max()!
        
        while l < r {
            let mid = l + (r - l) / 2
            var d = 0
            for field in fields {
                d += (field + mid - 1) / mid
            }
            
            if d > n {
                l = mid + 1
            } else {
                r = mid
            }
        }
        
        print(l)
    }
}
