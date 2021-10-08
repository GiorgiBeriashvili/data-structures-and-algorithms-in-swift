//
//  StackTests.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation
import XCTest
@testable import DataStructuresAndAlgorithms

private func validateClosingParentheses(_ string: String) -> Bool {
    var stack: Stack<Character> = []
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if !stack.isEmpty {
                stack.pop()
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

final class StackTests: XCTestCase {
    private var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }
    
    func test_push() {
        XCTAssertEqual(stack.description, "[ 1, 2, 3, 4 ]")
    }
    
    func test_pop() {
        XCTAssertEqual(stack.pop(), 4)
    }
    
    
    func test_peek() {
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func test_isEmpty() {
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_initWithArray() {
        let array = [1, 2, 3, 4]
        
        XCTAssertEqual(stack, Stack(array))
    }
    
    func test_arrayLiteral() {
        let stack: Stack = ["blueberry", "plain", "potato"]
        
        XCTAssertEqual(stack, ["blueberry", "plain", "potato"])
    }
    
    func test_validateClosingParentheses() {
        XCTAssertTrue(validateClosingParentheses("()"))
        
        XCTAssertTrue(validateClosingParentheses("hello(world)()"))
        
        XCTAssertFalse(validateClosingParentheses("(hello world"))
        
        XCTAssertFalse(validateClosingParentheses("((())(meow)))()))"))
    }
}
