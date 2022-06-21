//
//  RedBlackTree.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/6/18.
//

import Foundation

public enum Color {
    case red
    case black
}

extension Color {
    var symbol: String {
        switch self {
        case .black: return "■"
        case .red: return "□"
        }
    }
}

public enum RedBlackTree<Element: Comparable> {
    case empty
    indirect case node(Color, Element, RedBlackTree, RedBlackTree)
}

extension RedBlackTree: SortedSet {
    public init() {
        self = .empty
    }
}

public extension RedBlackTree {
    struct Index {
        fileprivate var value: Element?
    }
    
    var count: Int {
        switch self {
        case .empty:
            return 0
        case let .node(_, _, left, right):
            return left.count + right.count + 1
        }
    }

    func contains(_ element: Element) -> Bool {
        switch self {
        case .empty:
            return false
        case .node(_, element, _, _):
            return true
        case let .node(_, value, left, _) where value > element:
            return left.contains(element)
        case let .node(_, _, _, right):
            return right.contains(element)
        }
    }
    
    func forEach(_ body: (Element) throws -> Void) rethrows {
        switch self {
        case .empty:
            return
        case let .node(_, value, left, right):
            try left.forEach(body)
            try body(value)
            try right.forEach(body)
        }
    }
    
    @discardableResult
    mutating func insert(_ element: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let (tree, old) = inserting(element)
        self = tree
        return (old == nil, old ?? element)
    }
    
    func min() -> Element? {
        switch self {
        case .empty:
            return nil
        case let .node(_, value, left, _):
            return left.min() ?? value
        }
    }
    
    func max() -> Element? {
        switch self {
        case .empty:
            return nil
        case let .node(_, value, _, right):
            return right.max() ?? value
        }
    }
    
    private func inserting(_ element: Element) -> (tree: RedBlackTree, existingMember: Element?) {
        let (tree, old) = _inserting(element)
        switch tree {
        case let .node(.red, value, left, right):
            return (.node(.black, value, left, right), old)
        default:
            return (tree, old)
        }
    }
    
    private func _inserting(_ element: Element) -> (tree: RedBlackTree, old: Element?) {
        switch self {
        case .empty:
            return (.node(.red, element, .empty, .empty), nil)
        case let .node(_, value, _, _) where value == element:
            return (self, value)
        case let .node(color, value, left, right) where value > element:
            let (l, old) = left._inserting(element)
            if let old = old {
                return (self, old)
            }
            return (balanced(color, value, l, right), nil)
        case let .node(color, value, left, right):
            let (r, old) = right._inserting(element)
            if let old = old {
                return (self, old)
            }
            return (balanced(color, value, left, r), nil)
        }
    }
    
    func balanced(_ color: Color, _ value: Element, _ left: RedBlackTree, _ right: RedBlackTree) -> RedBlackTree {
        switch (color, value, left, right) {
        case let (.black, z, .node(.red, y, .node(.red, x, a, b), c), d):
            return .node(.red, y, .node(.black, x, a, b), .node(.black, z, c, d))
        case let (.black, z, .node(.red, x, a, .node(.red, y, b, c)), d):
            return .node(.red, y, .node(.black, x, a, b), .node(.black, z, c, d))
        case let (.black, x, a, .node(.red, z, .node(.red, y, b, c), d)):
            return .node(.red, y, .node(.black, x, a, b), .node(.black, z, c, d))
        case let (.black, x, a, .node(.red, y, b, .node(.red, z, c, d))):
            return .node(.red, y, .node(.black, x, a, b), .node(.black, z, c, d))
        default:
            return .node(color, value, left, right)
        }
    }
}

extension RedBlackTree: Collection {
    
    public var startIndex: Index {
        Index(value: min())
    }
    
    public var endIndex: Index {
        Index(value: nil)
    }
    
    public subscript(i: Index) -> Element {
        i.value!
    }
}

extension RedBlackTree: BidirectionalCollection {
    public func index(after i: Index) -> Index {
        let v = value(following: i.value!)
        precondition(v.found)
        return Index(value: v.next)
    }
    
    public func index(before i: Index) -> Index {
        if let value = i.value {
            let v = self.value(preceding: value)
            precondition(v.found)
            return Index(value: v.previous)
        }
        else {
            return Index(value: max()!)
        }
    }
    
    func value(following element: Element) -> (found: Bool, next: Element?) {
        switch self {
        case .empty:
            return (false, nil)
        case .node(_, element, _, let right):
            return (true, right.min())
        case let .node(_, value, left, _) where value > element:
            let v = left.value(following: element)
            return (v.found, v.next ?? value)
        case let .node(_, _, _, right):
            return right.value(following: element)
        }
    }
    
    func value(preceding element: Element) -> (found: Bool, previous: Element?) {
        switch self {
        case .empty:
            return (false, nil)
        case .node(_, element, let left, _):
            return (true, left.max())
        case let .node(_, value, _, right) where value < element:
            let v = right.value(preceding: element)
            return (v.found, v.previous ?? value)
        case let .node(_, _, left, _):
            return left.value(preceding: element)
        }
    }
}

extension RedBlackTree: CustomStringConvertible {
    func diagram(_ top: String, _ root: String, _ bottom: String) -> String {
        switch self {
        case .empty:
            return root + "•\n"
        case let .node(color, value, .empty, .empty):
            return root + "\(color.symbol) \(value)\n"
        case let .node(color, value, left, right):
            return right.diagram(top + "    ", top + "┌───", top + "│   ")
            + root + "\(color.symbol) \(value)\n"
            + left.diagram(bottom + "│   ", bottom + "└───", bottom + "    ")
        }
    }
    
    public var description: String {
        return self.diagram("", "", "")
    }
}

extension RedBlackTree.Index: Comparable {
    public static func ==(left: RedBlackTree<Element>.Index,
                          right: RedBlackTree<Element>.Index) -> Bool {
        return left.value == right.value
    }
    
    public static func <(left: RedBlackTree<Element>.Index,
                         right: RedBlackTree<Element>.Index) -> Bool {
        if let lv = left.value, let rv = right.value {
            return lv < rv
        }
        return left.value != nil
    }
}
