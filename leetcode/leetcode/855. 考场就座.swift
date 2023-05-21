//
//  855. 考场就座.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/30.
//

import Foundation

class ExamRoom {
    
    let n: Int
    var students = Set<Int>()

    init(_ n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        var s = 0
        if students.count > 0 {
            let nums = students.sorted()
            var dist = nums.first!
            var prev = -1
            for num in nums {
                if prev != -1 {
                    let d = (num - prev) / 2
                    if d > dist {
                        dist = d
                        s = prev + d
                    }
                }
                prev = num
            }
            
            if n - 1 - nums.last! > dist {
                s = n - 1
            }
        }
        students.insert(s)
        return s
    }
    
    func leave(_ p: Int) {
        students.remove(p)
    }
}
