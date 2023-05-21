//
//  535. TinyURL 的加密与解密.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/29.
//

import Foundation

class Codec535 {
    var data: [Int: String] = [:]
    var id: Int = 0
    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        id += 1
        data[id] = longUrl
        return "http://tinyurl.com/\(id)"
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        guard let str = shortUrl.split(separator: "/").last,
              let id = Int(str) else {
                  return ""
              }
        return data[id]!
    }
}
