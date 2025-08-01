
# Swift `filter` Function – Complete Guide

Swift's `filter` function is a powerful higher-order function that allows you to create a new collection containing only elements that satisfy a given condition.

---

## 📘 1. What is `filter`?

The `filter` function is used to **iterate over a collection** (like an array) and return a **new array** that includes **only those elements** which pass a condition specified in a closure.

### 🔍 Function Signature
```swift
func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element]
```

---

## 🧠 2. How it Works

| Concept      | Description                                                               |
|--------------|---------------------------------------------------------------------------|
| Closure      | A block of code that returns `true` or `false` for each element.          |
| Iteration    | The function iterates through each element of the collection.             |
| Return       | It includes the element in the result if the closure returns `true`.      |

---

## 🛠️ 3. Syntax

```swift
let result = collection.filter { condition }
```

---

## 📌 4. Examples

### ✅ Example 1: Filter Even Numbers

```swift
let numbers = [1, 2, 3, 4, 5, 6]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers)  // Output: [2, 4, 6]
```

### ✅ Example 2: Filter Strings with Specific Prefix

```swift
let names = ["Alice", "Bob", "Amanda", "Brian"]
let aNames = names.filter { $0.hasPrefix("A") }
print(aNames)  // Output: ["Alice", "Amanda"]
```

### ✅ Example 3: Filter Numbers Greater Than a Threshold

```swift
let values = [10, 25, 30, 45, 50]
let highValues = values.filter { $0 > 30 }
print(highValues)  // Output: [45, 50]
```

---

## 🧾 5. Real-World Use Case

### 🔄 Filtering Search Results

```swift
struct Product {
    let name: String
    let price: Double
}

let products = [
    Product(name: "iPhone", price: 999),
    Product(name: "iPad", price: 599),
    Product(name: "MacBook", price: 1299)
]

let filtered = products.filter { $0.price < 1000 }
print(filtered.map { $0.name })  // Output: ["iPhone", "iPad"]
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

- `filter` **does not modify** the original array.
- It **returns a new array** with the matching elements.
- The **closure** must return a `Bool`.

---

## ✅ 8. Summary

- `filter` is a simple yet essential Swift function.
- It allows for **concise**, **readable**, and **functional-style** code.
- Used widely in UI filtering, search logic, and data pre-processing.

---
