//
//  498. 对角线遍历.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/14.
//

import Foundation

func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    var m = 0
    var n = 0
    let maxM = mat.count - 1
    let maxN = mat[0].count - 1
    var up = true
    var ans: [Int] = []
    
    for _ in 0 ..< mat.count * mat[0].count {
        ans.append(mat[m][n])
        if up {
            if n == maxN {
                m += 1
                up.toggle()
                continue
            }
            if m == 0 {
                n += 1
                up.toggle()
                continue
            }
            m -= 1
            n += 1
        } else {
            if m == maxM {
                n += 1
                up.toggle()
                continue
            }
            if n == 0 {
                m += 1
                up.toggle()
                continue
            }
            
            m += 1
            n -= 1
        }
    }
    return ans
}
