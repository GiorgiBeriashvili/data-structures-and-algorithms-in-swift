//
//  QueueStack.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation

struct QueueStack<Element: Equatable>: Queue {
    private var enqueueStack: Stack<Element>
    private var dequeueStack: Stack<Element>
    
    var isEmpty: Bool {
        enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    init() {
        enqueueStack = []
        dequeueStack = []
    }
    
    func peek() -> Element? {
        !dequeueStack.isEmpty ? dequeueStack.storage.last : enqueueStack.storage.first
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.push(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack.storage = enqueueStack.storage.reversed()
            
            enqueueStack.storage.removeAll()
        }
        
        return dequeueStack.pop()
    }
}

extension QueueStack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        
        enqueueStack.storage = elements
    }
}
