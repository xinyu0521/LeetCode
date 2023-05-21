//
//  1145. 二叉树着色游戏.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/17.
//

import Foundation

func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
    var rootCnt = 0
    var leftCnt = 0
    var rightCnt = 0
    
    func dfs(_ root: TreeNode?, _ flag: Int) {
        guard let root = root else {
            return
        }
        
        if flag == 0 {
            rootCnt += 1
        } else if flag == 1 {
            leftCnt += 1
        } else if flag == 2 {
            rightCnt += 1
        }
        
        if root.val == x {
            dfs(root.left, 1)
            dfs(root.right, 2)
        } else {
            dfs(root.left, flag)
            dfs(root.right, flag)
        }
    }
    
    dfs(root, 0)
    rootCnt -= 1
    
    return max(rootCnt, max(leftCnt, rightCnt)) > n / 2
}
