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

checkDuplicateBrackets(expression: "(a)+((b+c))") // true
checkDuplicateBrackets(expression: "((a)+(b))") // false

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

isBalancedParantheses(expression: "([)]")


/*
 Question 3: 
 */
