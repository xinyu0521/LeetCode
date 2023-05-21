//
//  1237. 找出给定方程的正整数解.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/18.
//

import Foundation

class CustomFunction {
    // Returns f(x, y) for any given positive integers x and y.
    // Note that f(x, y) is increasing with respect to both x and y.
    // i.e. f(x, y) < f(x + 1, y), f(x, y) < f(x, y + 1)
    func f(_ x: Int, _ y: Int) -> Int {
        return 0
    }
}


func findSolution(_ customfunction: CustomFunction, _ z: Int) -> [[Int]] {
    var ans: [[Int]] = []
    var y = 1000
    for x in 0 ... 1000 {
        while y > 0, customfunction.f(x, y) > z {
            y -= 1
        }
        
        if y > 0, customfunction.f(x, y) == z {
            ans.append([x, y])
        }
    }
    
    return ans
}
