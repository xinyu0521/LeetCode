//
//  1656. 设计有序流.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/16.
//

import Foundation

class OrderedStream {
    
    var arr: [String]
    var i = 0

    init(_ n: Int) {
        arr = Array(repeating: "", count: n)
    }
    
    func insert(_ idKey: Int, _ value: String) -> [String] {
        var res: [String] = []
        let index = idKey - 1
        arr[index] = value
        if i != index {
            return []
        }
        
        while i < arr.count,
              arr[i] != ""
        {
            res.append(arr[i])
            i += 1
        }
        
        return res
    }
}
