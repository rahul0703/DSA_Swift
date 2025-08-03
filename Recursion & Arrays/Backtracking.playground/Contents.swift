/*
Question 1: N-Queens Problem
 Solution:
  1. As, no 2 or more queen can be placed in same row or column or diagonal. We need to check this.
  2. Use backtracking to solve the problem.
 */
func printAllNQueenPossibility(n: Int) {
  var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
  fillNQueenMatrix(matrix: &matrix, n: n, row: 0, pathSoFar: "")
}

private func fillNQueenMatrix(matrix: inout [[Int]], n: Int, row: Int, pathSoFar: String) {
  if row == n {
    print(pathSoFar)
    return
  }
  
  for col in 0 ..< n {
    if isSafe(matrix: matrix, row, col, n) {
      matrix[row][col] = 1 // Place the queen
      fillNQueenMatrix(matrix: &matrix, n: n, row: row + 1, pathSoFar: pathSoFar + "(\(row), \(col)) ")
      matrix[row][col] = 0 // Backtrack by removing the queen
    }
  }
}

private func isSafe(matrix: [[Int]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
  //Check column
  for j in 0 ..< row {
    if matrix[j][col] == 1 {
      return false // upper row already has a queen
    }
  }
  //Check upper left diagonals
  for j in 0 ..< min(row, col) {
    if matrix[row-j][col-j] == 1 {
      return false // Upper left diagonal has a queen
    }
  }
  
  //check upper right diagonals
  for j in 0 ..< min(row, n - col - 1) {
    if matrix[row-j][col+j] == 1 {
      return false // Upper right diagonal has a queen
    }
  }
  return true
}


/*
 Question 2: 
 */
