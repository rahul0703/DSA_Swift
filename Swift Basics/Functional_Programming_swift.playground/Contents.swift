/*
 Functional Programming: Functional Programming (FP) is a programming paradigm where:
    - Functions are first-class citizens (can be passed around like variables)
    -You write pure functions (no side effects)
    -You favor immutability (no variable mutation)
    -You avoid shared state and loops, using map, filter, reduce instead
 
 Swift is not a pure functional language, but it supports many functional programming features.
 */

//----------------------------------------------------------------------------------------------
/*
 First-Class Functions: Functions in Swift can be assigned to variables, passed as arguments, and returned from other functions.
 */
func greet(name: String) -> String {
    return "Hello, \(name)"
}
let greetingFunction = greet
print(greetingFunction("Rahul"))  // Hello, Rahul


//----------------------------------------------------------------------------------------------
/*
 Higher-Order Functions: Functions that take other functions as parameters or return functions.
 */
func operate(_ a: Int, _ b: Int, _ operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let result = operate(4, 2, { $0 * $1 })  // 8

//----------------------------------------------------------------------------------------------
/*
 Closures: Closures are self-contained blocks of functionality that can be passed around and used in your code.
 */
let multiply: (Int, Int) -> Int = { $0 * $1 }
let square = { (x: Int) -> Int in
    return x * x
}
print(square(5))  // 25

//----------------------------------------------------------------------------------------------
/*
 Immutability: In functional programming, you prefer immutability. Swift encourages using `let` for constants.
 Functional programming favors let (constant) over var (mutable).
 */
let name = "Rahul"   // Immutable
// name = "John"     // ❌ Error

//----------------------------------------------------------------------------------------------
/*
 Pure Functions: Functions that always produce the same output for the same input and have no side effects.
 */
func add(a: Int, b: Int) -> Int {
    return a + b   // Pure: No side effects
}
var total = 0

//func impureAdd(a: Int) {
//    total += a   // ❌ Not pure (modifies external state) no allowed
//}


//----------------------------------------------------------------------------------------------
/*
 Map, Filter, Reduce: Functional programming often uses these higher-order functions to process collections.
 */
let nums = [1, 2, 3]
let squared = nums.map { $0 * $0 }  // [1, 4, 9]

let even = nums.filter { $0 % 2 == 0 }  // [2]

let sum = nums.reduce(0) { $0 + $1 }  // 6
