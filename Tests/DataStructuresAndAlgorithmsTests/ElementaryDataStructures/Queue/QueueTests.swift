//
//  QueueTests.swift
//
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation
import XCTest
@testable import DataStructuresAndAlgorithms

private protocol BoardGameManager {
    associatedtype Player
    
    mutating func nextPlayer() -> Player?
}

extension QueueArray: BoardGameManager {
    typealias Player = Element
    
    @discardableResult
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else {
            return nil
        }
        
        enqueue(player)
        
        return player
    }
}

extension QueueStack: BoardGameManager {
    typealias Player = Element
    
    @discardableResult
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else {
            return nil
        }
        
        enqueue(player)
        
        return player
    }
}

final class QueueTests: XCTestCase {
    private var queueArray: QueueArray<String> = []
    private var queueStack: QueueStack<String> = []
    
    override func setUp() {
        queueArray.enqueue("Pusheen")
        queueArray.enqueue("Keyboard Cat")
        queueArray.enqueue("Lil Bub")
        
        queueStack.enqueue("Milo")
        queueStack.enqueue("Sassy")
        queueStack.enqueue("Ozma")
    }
    
    func test_enqueueArray() {
        XCTAssertEqual(queueArray.peek(), "Pusheen")
    }
    
    func test_enqueueStack() {
        XCTAssertEqual(queueStack.peek(), "Milo")
    }
    
    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        
        XCTAssertEqual(queueArray.peek(), "Lil Bub")
        
        queueArray.dequeue()
        
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func test_dequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        
        XCTAssertEqual(queueStack.peek(), "Ozma")
        
        queueStack.dequeue()
        
        XCTAssertTrue(queueStack.isEmpty)
    }
    
    func test_playerOrderWithQueueArray() {
        var queue: QueueArray<String> = []
        
        queue.enqueue("Kirby")
        queue.enqueue("Samus")
        queue.enqueue("Pikachu")
        queue.enqueue("Toon Ozma")
        
        XCTAssertEqual(queue.peek(), "Kirby")
        
        queue.nextPlayer()
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Pikachu")
        
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Toon Ozma")
        
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Kirby")
    }
    
    func test_playerOrderWithQueueStack() {
        var queue: QueueStack<String> = ["Kirby", "Samus", "Pikachu", "Toon Ozma"]
        
        XCTAssertEqual(queue.peek(), "Kirby")
        
        queue.nextPlayer()
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Pikachu")
        
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Toon Ozma")
        
        queue.nextPlayer()
        
        XCTAssertEqual(queue.peek(), "Kirby")
    }
}
