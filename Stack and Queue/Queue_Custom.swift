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

struct GraphNode: Comparable {
  var val: Int
  var dist: Int
  
  init(val: Int, dist: Int) {
    self.val = val
    self.dist = dist
  }
  
  func < (lhs: GraphNode, rhs: GraphNode) -> Bool {
    return lhs.dist < rhs.dist
  }
}

struct PriorityQueue {
  private var elements: [GraphNode] = []
  
  var isEmpty: Bool {
    return elements.isEmpty
  }
  
  var peek: GraphNode? {
    return elements.min() // lowest dist Node
  }
  
  mutating func enqueue(_ node: GraphNode) {
    elements.append(node)
  }
  
  mutating func dequeue() -> GraphNode? {
    guard !elements.isEmpty else { return nil }
    elements.sort()              // Sort by dist ascending
    return elements.removeFirst() // Remove node with smallest dist
  }
}
