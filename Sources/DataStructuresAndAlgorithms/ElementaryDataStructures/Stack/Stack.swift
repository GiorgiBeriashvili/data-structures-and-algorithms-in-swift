//
//  Stack.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation

struct Stack<Element: Equatable>: Equatable {
    var storage: [Element]
    
    var isEmpty: Bool {
        peek() == nil
    }
    
    init() {
        storage = []
    }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    func peek() -> Element? {
        storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let content = storage
            .map { "\($0)" }
            .joined(separator: ", ")
        
        return "[ \(content) ]"
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
