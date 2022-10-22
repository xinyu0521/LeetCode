//
//  22. 括号生成.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/20.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var leftCount = 0
    var rightCount = 0
    
    var str = ""
    var ans: [String] = []
    func backtracking() {
        if leftCount == n, rightCount == n {
            ans.append(str)
            return
        }
        
        if leftCount < n {
            str.append("(")
            leftCount += 1
            backtracking()
            str.removeLast()
            leftCount -= 1
        }
        if rightCount < leftCount {
            str.append(")")
            rightCount += 1
            backtracking()
            str.removeLast()
            rightCount -= 1
        }
    }
    
    backtracking()
    return ans
}
