//
//  1797. 设计一个验证系统.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/9.
//

import Foundation

class AuthenticationManager {
    
    let timeToLive: Int
    var map: [String: Int] = [:]
    
    init(_ timeToLive: Int) {
        self.timeToLive = timeToLive
    }

    func generate(_ tokenId: String, _ currentTime: Int) {
        map[tokenId] = currentTime + timeToLive
    }
    
    func renew(_ tokenId: String, _ currentTime: Int) {
        guard let time = map[tokenId], time > currentTime else {
            return
        }
        
        map[tokenId] = currentTime + timeToLive
    }
    
    func countUnexpiredTokens(_ currentTime: Int) -> Int {
        map.reduce(0) {
            $0 + ($1.value > currentTime ? 1 : 0)
        }
    }
}
