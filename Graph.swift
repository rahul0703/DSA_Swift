//
//  Graph_level_1.swift
//  DSA
//
//  Created by Rahul Sureka on 04/08/25.
//

import Foundation

class Graph {
  /*
   Question: Get all paths from start to end in a directed graph
   */
  func getAllPaths(_ graph: [[Int]], _ start: Int, _ end: Int) -> [[Int]] {
    var result: [[Int]] = []
    var visited = Array(repeating: false, count: graph.count)
    var path: [Int] = []
    visited[start] = true
    getAllPathsHelper(graph, &visited, start, end, &result, &path)
    return result
  }
  
  private func getAllPathsHelper(graph: [[Int]], visited: inout [Bool], start: Int, end: Int, result: inout [[Int]], path: inout [Int]) {
    if start == end {
      path.append(start)
      result.append(path)
      path.removeLast() // Remove the current node from path before returning
      return
    }
    //Add current node to path
    path.append(start)
    //Call to all neighbours
    for neighbor in graph[start] {
      if !visited[neighbor] {
        visited[neighbor] = true
        getAllPathsHelper(graph: graph, visited: &visited, start: neighbor, end: end, result: &result, path: &path)
        //Backtrack
        visited[neighbor] = false
      }
    }
    path.removeLast() // Remove the current node from path before returning
  }
  
  /*
    Question: Get connected components of the graph
   */
  func getConnectedComponents(_ graph: [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    var visited = Array(repeating: false, count: graph.count)
    for i in 0 ..< graph.count {
      if !visited[i] {
        var path: [Int] = []
        exploreComponents(graph, &visited, i, &path)
        result.append(path) // Add the found component to the result
      }
    }
    return result
  }
  
  private func exploreComponents(_ graph: [[Int]], _ visited: inout [Bool], _ node: Int, _ path: inout [Int]) {
    
    visited[node] = true
    path.append(node)
    for neighbor in graph[node] {
      if !visited[neighbor] {
        exploreComponents(graph, &visited, neighbor, &path)
      }
    }
  }
  
  /*
   Question: Check if the graph is connected
   */
  func isGraphConnected(_ graph: [[Int]]) -> Bool {
    var result = getConnectedComponents(graph)
    if result.count == 1 {
      return true // Graph is connected if there's only one component
    } else {
      return false
    }
  }
  
  /*
   Question: Count number of islands in a grid
   */
  func countNumberOfIslands(_ grid: [[Int]]) -> Int {
    var count = 0
    var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    for i in 0 ..< grid.count {
      for j in 0 ..< grid[i].count {
        if visited[i][j] == false && grid[i][j] == 1 {
          count += 1 // Found a new island
          exploreIsland(grid, &visited, i, j)
        }
      }
    }
    return count
  }
  
  private func exploreIsland(_ grid: [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int) {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[row].count || visited[row][col] || grid[row][col] == 0 {
      return
    }
    visited[row][col] = true
    //neighbour of 4 directions
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    for direction in directions {
      exploreIsland(grid, &visited, row + direction.0, col + direction.1)
    }
  }
  
  /*
   Question: Perfect friends problem
   Desc: Given a graph, find the number of perfect friends pairs where no two friends are connected directly or indirectly.
   */
  func countPerfectFriendsPairs(_ graph: [[Int]]) -> Int {
    var answer: [Int] = []
    var visited = Array(repeating: false, count: graph.count)
    for i in 0 ..< graph.count {
      var  count = 0
      if !visited[i] {
        countPerfectFriendsPairsHelper(graph, &visited, i, &count)
        answer.append(count) // Add the count of friends in this component
      }
    }
    var totalPairs = 0
    for i in 0 ..< answer.count {
      for j in i + 1 ..< answer.count {
        totalPairs += answer[i] * answer[j] // Count pairs from different components
      }
    }
    return totalPairs
  }
  
  private func countPerfectFriendsPairsHelper(_ graph: [[Int]], _ visited: inout [Bool], _ node: Int, _ count: inout Int) {
    visited[node] = true
    count += 1 // Increment the count of friends in this component
    
    for neighbor in graph[node] {
      if !visited[neighbor] {
        countPerfectFriendsPairsHelper(graph, &visited, neighbor, &count)
      }
    }
  }
  
  /*
   Question: Hamiltonian path problem
   Desc: Given a graph, find if there exists a Hamiltonian path in the graph. Where Hamiltonian path is a path that visits every vertex exactly once.
   Sol: This is very similar to getAllPaths problem, just the base case is different! There base case is if destination is reached and here along with that we also check if all nodes are visited.
   */
  func getAllHamiltonianPaths(_ graph: [[Int]], start: Int) -> [[Int]] {
    var result: [[Int]] = []
    var visited = Array(repeating: false, count: graph.count)
    var path: [Int] = []
    getAllHamiltonianPathHelper(graph, &visited, start, &result, &path)
    return result
  }
  
  private func getAllHamiltonianPathHelper(graph: [[Int]], visited: inout [Bool], start: Int, result: inout [[Int]], path: inout [Int]) {
    visited[start] = true
    path.append(start)
    
    if path.count == graph.count {
      result.append(path) // Found a Hamiltonian path
    } else {
      for neighbor in graph[start] {
        if !visited[neighbor] {
          getAllHamiltonianPathHelper(graph: graph, visited: &visited, start: neighbor, result: &result, path: &path)
        }
      }
    }
    path.removeLast() // Remove the current node from path before returning
    visited[start] = false // Backtrack
  }
  
  /*
   Question: check if hamiltonian cycle exists
   Desc: Given a graph, find if there exists a Hamiltonian cycle in the graph, where a Hamiltonian cycle is a cycle that visits every vertex exactly once and returns to the starting vertex.
   */
  func isHamiltonianCycleExists(_ graph: [[Int]], start: Int) -> Bool {
    var visited = Array(repeating: false, count: graph.count)
    var path: [Int] = []
    return getAllHamiltonianCycleHelper(graph, &visited, start, &path)
  }
  
  private func getAllHamiltonianCycleHelper(graph: [[Int]], visited: inout [Bool], start: Int, path: inout [Int]) -> Bool {
    visited[start] = true
    path.append(start)
    
    if path.count == graph.count {
      if graph[start].contains(path[0]) {
        return true // Found a Hamiltonian cycle
      }
    } else {
      for neighbor in graph[start] {
        if !visited[neighbor] {
          var answer = getAllHamiltonianCycleHelper(graph: graph, visited: &visited, start: neighbor, path: &path)
          if answer {
            return true // If a Hamiltonian cycle is found, return true
          }
        }
      }
    }
    path.removeLast() // Remove the current node from path before returning
    visited[start] = false
    return false // No Hamiltonian cycle found in this path
  }
  
  /*
   Question: Knight Tour problem
   Desc: Given a chessboard of size n x n, find all possible paths of a knight starting from the top left corner to the bottom right corner, where no cell is visited twice.
   */
  let rowMoves = [2, 1, -1, -2, -2, -1, 1, 2]
  let colMoves = [1, 2, 2, 1, -1, -2, -2, -1]
  func findAllKnightTourPaths(n: Int) -> [[String]] {
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var result: [[String]] = []
    var path: [String] = []
    findAllKnightTourPathsHelper(matrix: &matrix, visited: &visited, n: n, row: 0, col: 0, result: &result, path: &path)
    return result
  }
  
  private func findAllKnightTourPathsHelper(matrix: inout [[Int]], visited: inout [[Int]], n: Int, row: Int, col: Int, result: inout [[String]], path: inout [String]) {
    if row < 0 || row >= n || col < 0 || col >= n || visited[row][col] == 1 {
      return // Out of bounds or already visited
    }
    visited[row][col] = 1
    path.append("(\(row), \(col))") // Add current position to path
    
    if row == n - 1 && col == n - 1 {
      result.append(path) // Reached the bottom right corner, add path to result
    } else {
      for i in 0 ..< 8 {
        var ngr_row = row + rowMoves[i]
        var ngr_col = col + colMoves[i]
        
        findAllKnightTourPathsHelper(matrix: &matrix, visited: &visited, n: n, row: ngr_row, col: ngr_col, result: &result, path: &path)
      }
    }
    
    visited[row][col] = 0 // Backtrack by marking the cell as unvisited
    path.removeLast() // Remove the current position from path before returning
  }
  
  /*
   Question: Detect cycle in graph
   Solution: use BFS and track visited nodes, if we encounter a node already visited then cycle is present.
   Logic: If the node is enqueued more than 2 times before being marked visited, then a cycle is detected.
   */
  func detectCycleInUndirectedGraph(graph: [Int: [Int]]) -> Bool {
    var visited = Array(repeating: false, count: graph.count)
    for node in graph.keys {
      if !visited[node] {
        if bfs(graph, node, &visited) {
          return true
        }
      }
    }
    return false
  }
  
  private func bfs(_ graph: [Int: [Int]], _ start: Int, _ visited: inout [Bool]) -> Bool {
    var queue: QueueCustom<Int> = QueueCustom()
    queue.enqueue(start)
    while !queue.isEmpty() {
      let poppedNode = queue.dequeue()!
      if visited[poppedNode] {
        return true // Cycle detected
      }
      visited[poppedNode] = true
      for ngr in graph[poppedNode]! {
        if !visited[ngr] {
          queue.enqueue(ngr) // Enqueue unvisited neighbors
        }
      }
    }
    return false // No cycle detected
  }
  /*
   Find the shortest path from source to all other nodes in a weighted graph using Dijkstra's algorithm.
   */
  func dijkstraAlgorithm(_ graph: [Int: [(Int, Int)]], _ start: Int) -> [Int] {
    
  }
}



