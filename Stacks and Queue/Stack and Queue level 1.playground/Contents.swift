/*
 Question 1: Dublicate brackets
 Implement a function to check if a given expression has duplicate brackets.
 Solution: The correct way is to check if there are no characters between a pair of brackets (i.e., you pop zero elements before hitting '(')
 */
func checkDuplicateBrackets(expression: String) -> Bool {
    var stack = [Character]()
    for char in expression {
        if char != ")" {
            stack.append(char)
        } else {
            var count = 0
            while let last = stack.last, last != "(" {
                stack.popLast()
                count += 1
            }
            stack.popLast() // pop the '('
            if count == 0 {
                return true // Found duplicate brackets
            }
        }
    }
    return false // No duplicate brackets found
}

//checkDuplicateBrackets(expression: "(a)+((b+c))") // true
//checkDuplicateBrackets(expression: "((a)+(b))") // false

/*
 Question 2: Balanced Parentheses
 Desc: Implement a function to check if a given expression has balanced parentheses.
 Solution: Use a stack to keep track of opening parentheses and ensure they are properly closed.
 */

func isBalancedParantheses(expression: String) -> Bool {
    var stack = [Character]()
    for ch in expression {
        if ch == ")" || ch == "}" || ch == "]" {
            while !stack.isEmpty && stack.last != "(" && stack.last != "{" && stack.last != "[" {
                stack.popLast()
            }
            if stack.isEmpty {
                return false // No matching opening parenthesis
            }
            if ch == ")" && stack.last == "(" ||
                ch == "}" && stack.last == "{" ||
                ch == "]" && stack.last == "[" {
                stack.popLast() // Pop the matching opening parenthesis
            } else {
                return false // Mismatched parentheses
            }
        } else {
            stack.append(ch) // Push opening parentheses onto the stack
        }
    }
    if stack.isEmpty {
        return true // All parentheses are balanced
    } else {
        return false // Some opening parentheses are not closed
    }
}

//isBalancedParantheses(expression: "([)]")


/*
 Question 3: Next greater element to the right
 Desc: Given an array, find the next greater element for each element in the array.
 Sample testcase: [1,3,6,2,8,4,5,7] -> [3,6,8,8,-1,5,7,-1]
 Solution: We can use a stack to keep track of the next greater elements
 */

func nextGreaterElementToRight(arr: [Int]) -> [Int] {
    var solArray: [Int] = []
    var stack: [Int] = []
    var n = arr.count
    
    for i in (0..<n).reversed() {
        if i == n-1 {
            solArray.append(-1) // Last element has no next greater element
        } else {
            while !stack.isEmpty && stack.last! <= arr[i] {
                stack.popLast() //Pop elements that are not greater than the current element
            }
            if stack.isEmpty {
                solArray.append(-1) // No greater element found
            } else {
                solArray.append(stack.last!) // Next greater element found
            }
        }
        stack.append(arr[i]) // Push the current element onto the stack
    }
    return solArray.reversed() // Reverse the result to maintain original order
}

//nextGreaterElementToRight(arr: [1,3,6,2,8,4,5,7]) // [3,6,8,8,-1,5,7,-1]

/*
 Question 4: Largest area in histogram
 desc: Given an array representing the heights of bars in a histogram, find the largest rectangular area that can be formed.
 Soluton: Find the next smaller element to the left and right for each bar, then calculate the area using these indices.
 Video: https://youtu.be/0do2734xhnU?si=2GX40Uw0x_MHgix9
 */
func largestAreaInHistogram(heights: [Int]) -> Int {
    var n = heights.count
    var leftSmaller = findLeftSmaller(heights: heights, n: n)
    var rightSmaller = findRightSmaller(heights: heights, n: n)
    var maxArea = 0
    for i in 0 ..< n {
        let width = rightSmaller[i] - leftSmaller[i] - 1
        let area = heights[i] * width
        maxArea = max(maxArea, area)
    }
    return maxArea
}

private func findLeftSmaller(heights: [Int], n: Int) -> [Int] {
    var stack = [Int]()
    var leftSmaller: [Int] = []
    
    for i in 0 ..< n {
        while !stack.isEmpty && heights[stack.last!] >= heights[i] {
            stack.removeLast()
        }
        if stack.isEmpty {
            leftSmaller.append(-1) // No smaller element to the left
        } else {
            leftSmaller.append(stack.last!) // Index of the last smaller element
        }
        stack.append(i) // Push current index onto the stack
    }
    return leftSmaller
}

private func findRightSmaller(heights: [Int], n: Int) -> [Int] {
    var stack = [Int]()
    var rightSmaller: [Int] = []
    
    for i in (0 ..< n).reversed() {
        while !stack.isEmpty && heights[stack.last!] >= heights[i] {
            stack.removeLast()
        }
        if stack.isEmpty {
            rightSmaller.append(n) // No smaller element to the right
        } else {
            rightSmaller.append(stack.last!) // Index of the last smaller element
        }
        stack.append(i) // Push current index onto the stack
    }
    return rightSmaller.reversed() // Reverse to maintain original order
}

//---------------------------------------------------------------------------------
/*
 Question 5: Sliding window maximum
 Desc: Given an array and a window size, find the maximum element in each sliding window.
 Solution: we calculate the next greater element for each element and then loop for next K element to find the greatest element in the window.
 */

func slidingWindowMaximum(nums: [Int], k: Int) -> [Int] {
    var len = nums.count
    var solutionArray = [Int]()
    //Find the next greater element for each element in the array
    var nextGreaterIndex = findNextGreaterIndex(nums: nums)
    //Loop the array for i = 0 to n-k and find the maximum element in the window
    var j = 0
    for i in 0 ... len - k {
        j = max(i, j)
        while nextGreaterIndex[j] != -1 && nextGreaterIndex[j] < i + k {
            j = nextGreaterIndex[j]
        }
        solutionArray.append(nums[j]) // Append the maximum element in the window
    }
    return solutionArray
}

private func findNextGreaterIndex(nums: [Int]) -> [Int] {
    var solutionArray = [Int]()
    var stack = [Int]()
    var len = nums.count
    for i in (0 ..< len).reversed() {
        if i == len - 1 {
            solutionArray.append(-1) // Last element has no next greater element
            stack.append(i) // Push the index onto the stack
        } else {
            while !stack.isEmpty && nums[i] > nums[stack.last!] {
                stack.popLast() // Pop elements that are not greater than the current element
            }
            if stack.isEmpty {
                solutionArray.append(-1) // No greater element found
            } else {
                solutionArray.append(stack.last!) // Next greater element found
            }
            stack.append(i) // Push the current index onto the stack
        }
    }
    return solutionArray.reversed()
}
var nums = [1,3,1,2,0,5], k = 3
slidingWindowMaximum(nums: nums, k: k)


/*
 Question 6: Inflix evaluation
 */
























//Utility

struct stackQueue<T> {
    var inbox:[T] = []
    var outbox:[T] = []

    //mutating indicates that the method is permitted to modify the instance it belongs
    mutating func enqueue(_ element: T) {
        inbox.append(element) // Add element to the inbox stack
    }
    
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed() // Reverse the inbox stack to the outbox stack
            inbox.removeAll() // Clear the inbox stack
        }
        return outbox.popLast() // Remove and return the last element from the outbox stack
    }
    
    func isEmpty() -> Bool {
        return inbox.isEmpty && outbox.isEmpty // Check if both stacks are empty
    }
    
    func peek() -> T? {
        outbox.last ?? inbox.first // Return the last element of outbox or first of inbox if outbox is empty
    }
    
    func last() -> T? {
        inbox.last ?? outbox.first // Return the last element of inbox or outbox
    }
}
