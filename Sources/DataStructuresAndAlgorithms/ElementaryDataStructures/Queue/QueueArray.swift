//
//  QueueArray.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation

struct QueueArray<Element>: Queue {
    private var storage: [Element]
    
    var isEmpty: Bool {
        storage.isEmpty
    }
    
    init() {
        storage = []
    }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    func peek() -> Element? {
        storage.first
    }
    
    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        isEmpty ? nil : storage.removeFirst()
    }
}

extension QueueArray: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
