//
//  SortedSet.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/18.
//

import Foundation

protocol SortedSet: BidirectionalCollection, CustomStringConvertible where Element: Comparable {
    
    init()
    func contains(_ element: Element) -> Bool
    mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInsert: Element)
}

extension SortedSet {
    public var description: String {
        let contents = self.lazy.map{"\($0)"}.joined(separator: ",")
        return "[\(contents)]"
    }
}
