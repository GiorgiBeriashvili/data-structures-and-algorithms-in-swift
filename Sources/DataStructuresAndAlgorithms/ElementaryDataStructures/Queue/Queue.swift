//
//  Queue.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation

protocol Queue {
    associatedtype Element

    var isEmpty: Bool { get }
    
    func peek() -> Element?
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}
