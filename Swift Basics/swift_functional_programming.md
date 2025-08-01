# Functional Programming in Swift

Swift is a multi-paradigm language that supports **Functional Programming (FP)** features, even though it is not a purely functional language.

---

## 🔷 What is Functional Programming?

Functional Programming is a paradigm based on the use of **pure functions**, **immutability**, and **higher-order functions**. It avoids shared state, side effects, and emphasizes declarative over imperative programming.

### ✅ Core Principles:
- **First-class functions** – Functions can be assigned to variables and passed around.
- **Pure functions** – No side effects, same output for same input.
- **Immutability** – Prefer `let` over `var`.
- **Avoid shared mutable state** – Use map, filter, reduce instead of loops.

---

## 🔹 First-Class Functions

Functions in Swift are **first-class citizens** — they can be:
- Assigned to variables
- Passed as arguments
- Returned from other functions

```swift
func greet(name: String) -> String {
    return "Hello, \(name)"
}
let greetingFunction = greet
print(greetingFunction("Rahul"))  // Hello, Rahul
```

---

## 🔹 Higher-Order Functions

A **higher-order function** is a function that:
- Takes another function as a parameter
- Or returns a function

```swift
func operate(_ a: Int, _ b: Int, _ operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let result = operate(4, 2, { $0 * $1 })  // 8
```

---

## 🔹 Closures

**Closures** are self-contained blocks of functionality that can be passed and used like functions.

```swift
let multiply: (Int, Int) -> Int = { $0 * $1 }

let square = { (x: Int) -> Int in
    return x * x
}

print(square(5))  // 25
```

---

## 🔹 Immutability

Immutability ensures that values do not change after creation, reducing bugs and making code more predictable.

```swift
let name = "Rahul"   // Immutable
// name = "John"     // ❌ Error: Cannot assign to value
```

Use `let` by default and `var` only when necessary.

---

## 🔹 Pure Functions

A **pure function**:
- Has no side effects
- Returns the same output for the same input

```swift
func add(a: Int, b: Int) -> Int {
    return a + b   // ✅ Pure
}
```

```swift
var total = 0
// func impureAdd(a: Int) {
//     total += a   // ❌ Impure: modifies external state
// }
```

---

## 🔹 Functional Helpers: `map`, `filter`, `reduce`

These are Swift's standard **higher-order functions** used for transforming and aggregating collections.

### `map`
Applies a function to each element of a collection and returns a new collection.

```swift
let nums = [1, 2, 3]
let squared = nums.map { $0 * $0 }  // [1, 4, 9]
```

### `filter`
Returns a new array containing elements that satisfy a condition.

```swift
let even = nums.filter { $0 % 2 == 0 }  // [2]
```

### `reduce`
Combines all elements into a single value using a closure.

```swift
let sum = nums.reduce(0) { $0 + $1 }  // 6
```

---

## 💡 Additional Notes

- Swift encourages **immutability and expressions** over **mutable state and statements**.
- Use `map`, `filter`, and `reduce` to avoid explicit loops.
- Closures and higher-order functions allow more **declarative, concise** code.
- Understanding functional concepts can make your Swift code **cleaner, safer, and more testable**.
- Interviews may test FP knowledge through array transformations, recursion, or higher-order function design.

---

Mastering Functional Programming in Swift enhances your ability to write robust and expressive code — and is valued in modern iOS development and interviews.
