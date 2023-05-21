//
//  端口合并.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/26.
//

import Foundation

func duankouhebing() {
    while let line = readLine() {
        let n = Int(line)!
        var groups: [[Int]] = []
        var cnts: [[Int: Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let group = line.split(separator: ",").map { Int($0)! }
                groups.append(group)
                let cnt = group.reduce(into: [Int: Int]()) {
                    $0[$1, default: 0] += 1
                }
                cnts.append(cnt)
            }
        }
        
        var flags = Array(repeating: false, count: n)
        var con = true
        
        while con {
            con = false

            for i in 0 ..< n - 1 {
                if flags[i] || groups[i].count == 1 {
                    continue
                }
                
                for j in i + 1 ..< n {
                    if groups[j].count == 1 {
                        continue
                    }
                    
                    let cnti = cnts[i]
                    let cntj = cnts[j]
                    
                    var c = 0
                    for (key, val) in cnti {
                        let jval = cntj[key, default: 0]
                        if jval > 0 {
                            c += min(val, jval)
                        }
                    }
                    
                    if c >= 2 {
                        groups[j] = groups[i] + groups[j]
                        for (key, val) in cnti {
                            cnts[j][key, default: 0] += val
                        }
                        flags[i] = true
                        con = true
                    }
                }
            }
        }
        
        var ans: [Set<Int>] = []
        for i in 0 ..< n {
            if flags[i] == true { continue }
            ans.append(Set(groups[i]))
        }
        
        print(ans)
    }
}
