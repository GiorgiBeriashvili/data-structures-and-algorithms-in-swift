//
//  SortingAlgorithms.swift
//  
//
//  Created by Giorgi Beriashvili on 06.10.21.
//

import Foundation

func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 1 else {
        return
    }
    
    for end in (1..<array.count).reversed() {
        var didSwap = false
        
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                
                didSwap = true
            }
        }
        
        if !didSwap {
            return
        }
    }
}

func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 1 else {
        return
    }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count > 1 else {
        return
    }
    
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
}

private func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            
            rightIndex += 1
        } else {
            result.append(leftElement)
            
            leftIndex += 1
            
            result.append(rightElement)
            
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}
