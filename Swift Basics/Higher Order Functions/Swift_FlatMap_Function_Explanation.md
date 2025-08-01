
# Swift `flatMap` Function – Complete Guide

The `flatMap` function in Swift is a higher-order function used to **transform** and then **flatten** a collection of collections. It helps reduce one level of nesting in the result.

---

## 📘 1. What is `flatMap`?

The `flatMap` function first applies a transformation to each element of a collection and then flattens the resulting collection **by one level**.

### 🔍 Function Signature
```swift
func flatMap<SegmentOfResult>(_ transform: (Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence
```

---

## 🧠 2. How it Works

| Concept    | Description                                                            |
|------------|------------------------------------------------------------------------|
| Transform  | Applies a transformation to each element in the collection.            |
| Flatten    | Flattens the nested result into a single-level array.                  |
| Returns    | A new array that is a flattened version of the mapped results.         |

---

## 🛠️ 3. Syntax

```swift
let result = collection.flatMap { transformation returning a collection }
```

---

## 📌 4. Examples

### ✅ Example 1: Flatten a Nested Array

```swift
let nested = [[1, 2, 3], [4, 5], [6]]
let flat = nested.flatMap { $0 }
print(flat)  // Output: [1, 2, 3, 4, 5, 6]
```

### ✅ Example 2: Split and Flatten Words

```swift
let phrases = ["hello world", "swift rocks"]
let words = phrases.flatMap { $0.split(separator: " ") }
print(words)  // Output: ["hello", "world", "swift", "rocks"]
```

---

## 🧾 5. Real-World Use Case

### 🗂️ Parsing Optional Arrays

```swift
let optionalArrays: [[Int]?] = [[1, 2], nil, [3, 4]]
let flatArray = optionalArrays.compactMap { $0 }.flatMap { $0 }
print(flatArray)  // Output: [1, 2, 3, 4]
```

---

## 🧪 6. Difference Between `map`, `flatMap`, and `compactMap`

| Function      | Description                                             | Example Result         |
|---------------|---------------------------------------------------------|-------------------------|
| `map`         | Transforms each element and retains structure           | `[[1, 2], [3, 4]]`      |
| `flatMap`     | Transforms and flattens one level                       | `[1, 2, 3, 4]`          |
| `compactMap`  | Transforms and removes `nil` values                     | `[1, 2, 3]`             |

---

## 🧩 7. Things to Remember

- `flatMap` is useful when dealing with **nested sequences**.
- It only flattens **one level** of depth.
- Use `compactMap` for removing `nil` values from optionals.

---

## ✅ 8. Summary

- `flatMap` transforms and flattens results in one step.
- It is ideal for working with nested arrays and sequences.
- Use it to simplify data pipelines where nesting is unwanted.

---
