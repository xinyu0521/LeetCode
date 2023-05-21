//
//  497. 非重叠矩形中的随机点.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/9.
//

import Foundation

class Solution497 {
    
    
    var arr: [Int] = []
    let rects: [[Int]]
    
    init(_ rects: [[Int]]) {
        self.rects = rects
        arr.append(0)
        for rect in rects {
            if let last = arr.last {
                let a = rect[0], b = rect[1], x = rect[2], y = rect[3]
                arr.append(last + (x - a + 1) * (y - b + 1))
            }
        }
    }
    
    func pick() -> [Int] {
        var k = Int.random(in: 0 ... arr.last! - 1)
        let index = binarySearch(target: k + 1) - 1
        k -= arr[index]
        let rect = rects[index]
        let a = rect[0], b = rect[1], x = rect[2], y = rect[3]
        let col = y - b + 1
        let da = k / col
        let db = k - da * col
        return [a + da, b + db]
    }
    
    func binarySearch(target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let val = arr[mid]
            if val > target {
                right = mid - 1
            } else if val < target {
                left = mid + 1
            } else {
                return mid
            }
        }
        return left
    }
}
