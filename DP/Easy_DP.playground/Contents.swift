// Dynamic Programming - Easy Level Problems


//Question 1: Fibonacci Sequence
func fibonacciSequenceUsingRecursion(n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    return fibonacciSequenceUsingRecursion(n: n - 1) + fibonacciSequenceUsingRecursion(n: n - 2)
}
//Problem in the above code
/*
 the fib(n) = fib(n-1) + fib(n-2)
 this fib(n-1) calls fib(n-2) and fib(n-3) again and although we already have fib(n-2) calculated, we are calculating it again.
 like wise we are calculating fib(n-3) again and so on.
 
 Solution:
 Can't we store the values in a dictionary or array and use them when needed?
// Yes, we can use memoization or tabulation to store the values and use them when needed.
 */

//Using Memozization
func fibonacciSequenceUsingMemoization(n: Int) -> Int {
    var dp = Array(repeating: -1, count: n + 1)
    fillDP(&dp, n)
    return dp[n]
}
private func fillDP(_ dp: inout [Int], _ n: Int) {
    if n == 0 || n == 1 {
        dp[n] = n
        return
    }
    fillDP(&dp, n-1)
    return dp[n] = dp[n-1] + dp[n-2]
}

//Using Tabulation
func fibonacciSequenceUsingTabulation(n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    for i in 0 ... n {
        if i == 0 || i == 1 {
            dp[i] = i
        } else {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
    }
    return dp[n]
}
fibonacciSequenceUsingRecursion(n: 10)
fibonacciSequenceUsingTabulation(n: 8)

//-------------------------------------------------------------------------------
/*
 Question 2: Climbing down stairs
 Desc: you are climing down a staircase with n steps. You can either take 1 step, 2 steps or 3 at a time. How many distinct ways can you climb down the stairs?
 */
func climbingDownStairsUsingMemozation(n: Int) -> Int {
    var dp = Array(repeating: -1, count: n + 1)
    fillDPForClimbingDownStairs(&dp, n)
    return dp[n]
}
private func fillDPForClimbingDownStairs(_ dp: inout [Int], _ n: Int) {
    if n == 0 {
        dp[0] = 1
        return
    }
    fillDPForClimbingDownStairs(&dp, n-1)
    dp[n] = (n >= 1 ? dp[n-1] : 0) + (n >= 2 ? dp[n-2] : 0) + (n >= 3 ? dp[n-3] : 0)
}

func climbingDownStairsUsingTabulation(n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 1 // Base case: 1 way to go from ground to ground
    for i in 1 ... n {
        if i == 1 {
            dp[i] = dp[i-1] // Only one way to go from 1 to ground
        } else if i == 2 {
            dp[i] = dp[i-1] + dp[i-2] // Two ways to go from 2 to ground
        } else if i == 3 {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3] // Three ways to go from 3 to ground
        } else {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3] // For n > 3, sum of the last three steps
        }
    }
    return dp[n]
}
climbingDownStairsUsingMemozation(n: 10)
climbingDownStairsUsingTabulation(n: 10)
//-------------------------------------------------------------------------------
/*
 Question 3: Minimum Cost Path
 Desc: Given a 2D grid of costs, find the minimum cost to reach from the top-left corner to the bottom-right corner. You can only move right or down.
 */
func minCostPathUsingMemoization(grid: [[Int]]) -> Int {
    let rows = grid.count
    let cols = grid[0].count
    
    var dp = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    return findMinCostPath(&dp, grid, rows - 1, cols - 1)
}
private func findMinCostPath(_ dp: inout [[Int]], _ grid: [[Int]], _ row: Int, _ col: Int) -> Int {
    if dp[row][col] != -1 {
        return dp[row][col]
    }
    if row == 0 && col == 0 {
        dp[row][col] = grid[row][col]
        return dp[row][col]
    }
    if row > 0 && col > 0 {
        dp[row][col] = min(findMinCostPath(&dp, grid, row - 1, col) + grid[row][col],
                   findMinCostPath(&dp, grid, row, col - 1) + grid[row][col])
    } else if row > 0 {
        dp[row][col] = findMinCostPath(&dp, grid, row - 1, col) + grid[row][col]
    } else {
        dp[row][col] = findMinCostPath(&dp, grid, row, col - 1) + grid[row][col]
    }
    return dp[row][col]
}

func minCostPathUsingTabulation(grid: [[Int]]) -> Int {
    let rows = grid.count
    let cols = grid[0].count
    
    var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for i in 0..<rows {
        for j in 0..<cols {
            if i == 0 && j == 0 {
                dp[i][j] = grid[i][j] // Starting point
            } else if (i == 0) {
                dp[i][j] = dp[i][j - 1] + grid[i][j] // Can only come from left
            } else if (j == 0) {
                dp[i][j] = dp[i - 1][j] + grid[i][j] // Can only come from above
            } else {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j] // Take the minimum from left or above
            }
        }
    }
    return dp[rows - 1][cols - 1] // Return the minimum cost to reach the bottom-right corner
}

var grid = [
    [1, 3, 1],
    [1, 5, 4],
    [4, 2, 1]
]
minCostPathUsingMemoization(grid: grid)
minCostPathUsingTabulation(grid: grid)

// -------------------------------------------------------------------------------
//New group of DP questions - Target Sum subsets - Most IMP
/*
    Question 1: Subset sum problem
 desc: Given a set of non-negative integers, determine if there is a subset that sums up to a given target.
 
 Solution: Cosider it as a cricket match problem, where you can either choose to play a shot or not. Lets say, the x players has to score 50 runs combined with all previous players. The xth player can only score 11 runs, the possiblities are:
    1. xth player scores 11 runs, then the previous players have to score 39 runs.
    2. xth player does not score, then the previous players have to score 50 runs.
 
 This way we can break the problem into smaller subproblems.
*/

func subsetSumUsingMemoization(nums: [Int], target: Int) -> Bool {
    var length = nums.count
    var dp = Array(repeating: Array(repeating: false, count: target+1), count: length)
    return calculateSubsetSum(&dp, nums, length - 1, target)
}

private func calculateSubsetSum(_ dp: inout [[Bool]], _ nums: [Int], _ index: Int, _ target: Int) -> Bool {
    if target == 0 {
        dp[index][target] = true
    } else if index == 0 {
        if nums[index] == target {
            dp[index][target] = true
        } else {
            dp[index][target] = false
        }
    } else {
        if target >= nums[index] {
            dp[index][target] = calculateSubsetSum(&dp, nums, index-1, target) ||
                                calculateSubsetSum(&dp, nums, index-1, target-nums[index])
        } else {
            dp[index][target] = calculateSubsetSum(&dp, nums, index-1, target)
        }
    }
    return dp[index][target]
}

func subsetSumUsingTabulation(nums: [Int], target: Int) -> Bool {
    let length = nums.count
    var dp = Array(repeating: Array(repeating: false, count: target + 1), count: length)
    
    for i in 0 ..< length {
        for j in 0 ... target {
            if j == 0 {
                dp[i][j] = true
            } else if i == 0 {
                if nums[i] == target {
                    dp[i][j] = true
                } else {
                    dp[i][j] = false
                }
            } else {
                if j >= nums[i] {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-nums[i]]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
    }
    return dp[length-1][target]
}
    
var num = [3, 34, 4, 12, 2, 3]
subsetSumUsingMemoization(nums: num, target: 9)
subsetSumUsingTabulation(nums: num, target: 9)

//-------------------------------------------------------------------------------
/*
 Question 2: Coin change permutation
 Desc: Given a set of coins with infinite supply and a target amount, find the number of ways (permutation) to make the target amount using the coins.
 solution: The problem can be solved, by traversing from 0 to target like we travel from 0 to target and calculate the number of ways to reach each amount using coins.
 ex: let say we have 1, 2, 5 coins and we want to calculate for 15. We will sum the ways to reach 14, 13 and 10
 */

func coinChangePermutationUsingMemoization(coins: [Int], target: Int) -> Int {
    var dp = Array(repeating: -1, count: target + 1)
    return calculateCoinChangePermutation(&dp, coins, target)
}

private func calculateCoinChangePermutation(_ dp: inout [Int], _ coins: [Int], _ target: Int) -> Int {
    if dp[target] != -1 {
        return dp[target]
    }
    if target == 0 {
        dp[target] = 1
    } else {
        var sum = 0
        for coin in coins {
            if target - coin >= 0 {
                sum += calculateCoinChangePermutation(&dp, coins, target - coin)
            }
        }
        dp[target] = sum
    }
    
    return dp[target]
}

func coinChangePermutationUsingTabulation(coins: [Int], target: Int) -> Int {
    var dp = Array(repeating: 0, count: target + 1)
    for i in 0 ... target {
        if i == 0 {
            dp[i] = 1 // Base case: 1 way to make 0 amount
        }
        for coin in coins {
            if i >= coin {
                dp[i] += dp[i - coin] // Add the number of ways to make (i - coin)
            }
        }
    }
    return dp[target]
}
var nums = [1, 2, 5]
coinChangePermutationUsingMemoization(coins: nums, target: 5)
coinChangePermutationUsingTabulation(coins: nums, target: 5)



/*
 Question 3: Coin change combination
 Desc: Given a set of coins with infinite supply and a target amount, find the number of ways (combination) to make the target amount using the coins.
 Solution: The problem can be solved, by traversing from 0 to target like we travel from 0 to target and calculate the number of ways to reach each amount using coins. Remember it is combination, so we will not consider the order of coins.
 */

func coinChangeCombinationUsingTabulation(coins: [Int], target: Int) -> Int {
    var dp = Array(repeating: 0, count: target + 1)
    for coin in coins {
        for i in 0 ... target {
            if i == 0 {
                dp[i] = 1
            } else {
                if i >= coin {
                    dp[i] += dp[i - coin]
                }
            }
        }
    }
    return dp[target]
}

func coinChangeCombinationUsingMemoization(coins: [Int], target: Int) -> Int {
    var dp = Array(
        repeating: Array(repeating: -1, count: target + 1),
        count: coins.count + 1
    )
    return calculateCoinChangeCombination(&dp, coins, 0, target)
}

private func calculateCoinChangeCombination(_ dp: inout [[Int]], _ coins: [Int], _ index: Int, _ target: Int) -> Int {
    if target == 0 { return 1 }
    if target < 0 || index == coins.count { return 0 }
    if dp[index][target] != -1 { return dp[index][target] }
    
    // Include current coin
    let include = calculateCoinChangeCombination(&dp, coins, index, target - coins[index])
    // Exclude current coin
    let exclude = calculateCoinChangeCombination(&dp, coins, index + 1, target)
    
    dp[index][target] = include + exclude
    return dp[index][target]
}

coinChangeCombinationUsingTabulation(coins: nums, target: 5)
coinChangeCombinationUsingMemoization(coins: nums, target: 5)

//-------------------------------------------------------------------------------
/*
 Question 4: Knapsack problem
 Desc: Given a set of items, each with a weight and value, determine the maximum value that can be obtained by selecting items such that their total weight does not exceed a given capacity.
 */
func knapsackUsingTabulation(items: [(weight: Int, value: Int)], capacity: Int) -> Int {
    let n = items.count
    var dp = Array(repeating: Array(repeating: -1, count: capacity + 1), count: n)
    
    for i in 0 ..< n {
        for j in 0 ... capacity {
            if j == 0 {
                dp[i][j] = 0
            } else {
                //exclude
                var exclude = i > 0 ? dp[i - 1][j] : 0
                var include = j >= items[i].weight ? items[i].value + (i > 0 ? dp[i-1][j-items[i].weight] : 0) : 0
                
                dp[i][j] = max(include, exclude)
            }
        }
    }
    return dp[n - 1][capacity]
}

func knapsackleUsingMemoization(items: [(weight: Int, value: Int)], capacity: Int) -> Int {
    let n = items.count
    var dp = Array(repeating: Array(repeating: -1, count: capacity + 1), count: n)
    
    return calculateKnapsack(&dp, items, n - 1, capacity)
}

private func calculateKnapsack(_ dp: inout [[Int]], _ items: [(weight: Int, value: Int)], _ index: Int, _ capacity: Int) -> Int {
    if dp[index][capacity] != -1 {
        return dp[index][capacity]
    }
    if capacity == 0 {
        dp[index][capacity] = 0
        return dp[index][capacity]
    }
    
    //include
    var include = capacity >= items[index].weight ? items[index].value + (index > 0 ? calculateKnapsack(&dp, items, index - 1, capacity - items[index].weight) : 0) : 0
    //exclude
    var exclude = index > 0 ? calculateKnapsack(&dp, items, index - 1, capacity) : 0
    
    dp[index][capacity] = max(include, exclude)
    return dp[index][capacity]
}

var items = [(weight: 1, value: 1), (weight: 3, value: 4), (weight: 4, value: 6)]
knapsackUsingTabulation(items: items, capacity: 5)
knapsackleUsingMemoization(items: items, capacity: 5)



    



    
    
    
    
    
