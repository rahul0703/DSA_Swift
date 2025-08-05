//
//  Queue_Custom.swift
//  DSA
//
//  Created by Rahul Sureka on 05/08/25.
//

import Foundation

struct QueueCustom<T> {
  private var inputStack: [T] = []
  private var outputStack: [T] = []
  var size: Int {
    return inputStack.count + outputStack.count
  }
  var isEmpty: Bool {
    return size == 0
  }
  
  mutating func add(_ element: T) {
    inputStack.append(element)
  }
  
  mutating func remove() -> T? {
    if outputStack.isEmpty {
      outputStack = inputStack.reversed()
      inputStack = []
      return outputStack.popLast()
    } else {
      return outputStack.popLast()
    }
  }
  
  func peek() -> T? {
    if !outputStack.isEmpty {
      return outputStack.last
    } else {
      return inputStack.first
    }
  }
}
