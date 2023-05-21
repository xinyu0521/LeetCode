//
//  1233. 删除子文件夹.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/8.
//

import Foundation

func removeSubfolders(_ folder: [String]) -> [String] {
    let folder = folder.sorted()
    var res: [String] = [folder.first!]
    for f in folder.dropFirst() {
        let last = res.last! + "/"
        if f.hasPrefix(last) {
            continue
        }
        res.append(f)
    }
    
    return res
}
