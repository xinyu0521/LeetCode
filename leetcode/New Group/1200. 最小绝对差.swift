//
//  1200. 最小绝对差.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/4.
//

import Foundation

func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
    var stack: [[Int]] = []
    let arr = arr.sorted()
    
    for i in 0 ..< arr.count - 1 {
        if stack.isEmpty {
            stack.append([arr[i], arr[i + 1]])
        }
        
        if abs(arr[i] - arr[i + 1]) > abs(stack.last![0] - stack.last![1]) {
            continue
        }
        
        while !stack.isEmpty, abs(arr[i] - arr[i + 1]) < abs(stack.last![0] - stack.last![1]) {
            stack.removeLast()
        }
        
        stack.append([arr[i], arr[i + 1]])
    }
    
    return stack
}
