//
//  SortedArray.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/18.
//

import Foundation

public struct SortedArray<Element: Comparable>: SortedSet {
    fileprivate var storage: [Element] = []
    public init () {}
}

extension SortedArray {
    
    func index(for element: Element) -> Int {
        var start = 0
        var end = storage.count
        while start < end {
            let mid = start + (end - start) / 2
            if element > storage[mid] {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return start
    }
    
    public func index(of element: Element) -> Int? {
        let index = index(for: element)
        guard index < storage.count, storage[index] == element else {
            return nil
        }
        return index
    }
    
    public func contains(_ element: Element) -> Bool {
        let index = index(for: element)
        return index < storage.count && storage[index] == element
    }
    
    public func forEach(_ body: (Element) throws -> Void) rethrows {
        try storage.forEach(body)
    }
    
    public func sorted() -> [Element] {
        storage
    }
    
    @discardableResult
    public mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let index = index(for: newElement)
        if index < storage.count, storage[index] == newElement {
            return (false, storage[index])
        }
        storage.insert(newElement, at: index)
        return (true, newElement)
    }
}

extension SortedArray: RandomAccessCollection {
    public typealias Indices = CountableRange<Int>
    public var startIndex: Int {
        storage.startIndex
    }
    public var endIndex: Int {
        storage.endIndex
    }
    public subscript(index: Int) -> Element {
        return storage[index]
    }
}
