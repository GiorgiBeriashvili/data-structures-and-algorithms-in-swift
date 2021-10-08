//
//  SortingAlgorithmsTests.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation
import XCTest
@testable import DataStructuresAndAlgorithms

final class SortingAlgorithmsTests: XCTestCase {
    var array: [Int] = []
    var sortedArray = [2, 3, 3, 4, 6, 7, 9, 11, 15]
    
    override func setUp() {
        array.append(contentsOf: [7, 2, 6, 3, 3, 9, 15, 4, 11])
    }
    
    func test_bubbleSort() {
        bubbleSort(&array)
        
        XCTAssertEqual(array, sortedArray)
    }
    
    func test_selectionSort() {
        selectionSort(&array)
        
        XCTAssertEqual(array, sortedArray)
    }
    
    func test_insertionSort() {
        insertionSort(&array)
        
        XCTAssertEqual(array, sortedArray)
    }
    
    func test_mergeSort() {
        XCTAssertEqual(mergeSort(array), sortedArray)
    }
}
