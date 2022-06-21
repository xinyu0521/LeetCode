//
//  OrderedSet.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/18.
//

import Foundation

public struct OrderedSet<Element: Comparable>: SortedSet {
    class Canary {}
    fileprivate var storage = NSMutableOrderedSet()
    fileprivate var canary = Canary()
}

extension OrderedSet {
    fileprivate static func compare(_ a: Any, _ b: Any) -> ComparisonResult {
        let a = a as! Element
        let b = b as! Element
        if a < b { return .orderedAscending }
        if a > b { return .orderedDescending }
        return .orderedSame
    }
    
    fileprivate mutating func makeUnique() {
        if !isKnownUniquelyReferenced(&canary) {
            storage = storage.mutableCopy() as! NSMutableOrderedSet
            canary = Canary()
        }
    }
    
    fileprivate func index(for element: Element) -> Int {
        storage.index(
            of: element,
            inSortedRange: NSRange(0 ..< storage.count),
            options: .insertionIndex,
            usingComparator: OrderedSet.compare(_:_:))
    }
    
    public func forEach(_ body: (Element) -> Void) {
        storage.forEach{body($0 as! Element)}
    }
    
    public func index(of element: Element) -> Int? {
        let index = storage.index(
            of: element,
            inSortedRange: NSRange(0 ..< storage.count),
            usingComparator: OrderedSet.compare(_:_:))
        return index == NSNotFound ? nil : index
    }
    
    public func contains2(_ element: Element) -> Bool {
        index(of: element) != nil
    }
    
    public func contains(_ element: Element) -> Bool {
        storage.contains(element) || index(of: element) != nil
    }
    
    @discardableResult
    public mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let index = index(for: newElement)
        if index < storage.count, storage[index] as! Element == newElement {
            return (false, storage[index] as! Element)
        }
        makeUnique()
        storage.insert(newElement, at: index)
        return (true, newElement)
    }
}

extension OrderedSet: RandomAccessCollection {
    public typealias Index = Int
    public typealias Indices = CountableRange<Int>
    public var startIndex: Int {
        0
    }
    public var endIndex: Int {
        storage.count
    }
    public subscript(i: Int) -> Element {
        storage[i] as! Element
    }
}


