
# Swift `reduce` Function – Complete Guide

The `reduce` function in Swift is a higher-order function that combines all elements of a collection into a **single value** using a closure.

---

## 📘 1. What is `reduce`?

The `reduce` function iterates over a collection and **accumulates a single result** by applying a closure that takes the current accumulated value and the next element in the sequence.

### 🔍 Function Signature
```swift
func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
```

---

## 🧠 2. How it Works

| Concept       | Description                                                              |
|---------------|--------------------------------------------------------------------------|
| Initial Value | The starting value for the result.                                       |
| Closure       | A function that takes the current result and the next item, and returns the new result. |
| Return        | A single combined value of the same or different type.                  |

---

## 🛠️ 3. Syntax

```swift
let result = collection.reduce(initialValue) { accumulated, element in
    // combine and return new accumulated value
}
```

---

## 📌 4. Examples

### ✅ Example 1: Sum of Numbers

```swift
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)  // Output: 15
```

### ✅ Example 2: Concatenate Strings

```swift
let words = ["Swift", "is", "awesome"]
let sentence = words.reduce("") { $0 + " " + $1 }
print(sentence.trimmingCharacters(in: .whitespaces))  // Output: "Swift is awesome"
```

### ✅ Example 3: Multiply All Elements

```swift
let numbers = [1, 2, 3, 4]
let product = numbers.reduce(1) { $0 * $1 }
print(product)  // Output: 24
```

---

## 🧾 5. Real-World Use Case

### 🧮 Aggregating Prices

```swift
struct Item {
    let name: String
    let price: Double
}

let cart = [
    Item(name: "Book", price: 12.99),
    Item(name: "Pen", price: 1.49),
    Item(name: "Notebook", price: 5.99)
]

let total = cart.reduce(0.0) { $0 + $1.price }
print(total)  // Output: 20.47
```

---

## 📊 6. Comparison with Other Functions

| Function   | Purpose                                  | Returns            |
|------------|------------------------------------------|--------------------|
| `filter`   | Filters elements based on a condition    | `[Element]`        |
| `map`      | Transforms each element                  | `[Transformed]`    |
| `reduce`   | Combines elements into a single value    | `Result`           |
| `compactMap` | Removes nils after transforming         | `[NonOptional]`    |

---

## 🧩 7. Things to Remember

- `reduce` **can return a different type** than the collection's element type.
- Useful for **aggregation**, **summarization**, and **transformation**.
- It **does not mutate** the original collection.

---

## ✅ 8. Summary

- `reduce` is ideal for turning a list of items into a single summary result.
- It improves code readability and avoids explicit looping.
- Common use cases include sum, product, string concatenation, and more.

---
