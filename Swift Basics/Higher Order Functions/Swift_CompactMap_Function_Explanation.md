
# Swift `compactMap` Function – Complete Guide

The `compactMap` function in Swift is a higher-order function used to **transform** elements in a collection and **remove any resulting nil values**, producing a non-optional, flattened array.

---

## 📘 1. What is `compactMap`?

`compactMap` applies a transformation to each element of a collection and **filters out nil values** from the resulting array.

### 🔍 Function Signature
```swift
func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
```

---

## 🧠 2. How it Works

| Concept    | Description                                                              |
|------------|--------------------------------------------------------------------------|
| Transform  | Applies a function that may return `nil` to each element.                |
| Filter     | Removes all `nil` values from the result.                                |
| Return     | Returns a non-optional array of transformed values.                      |

---

## 🛠️ 3. Syntax

```swift
let result = collection.compactMap { transformation returning optional }
```

---

## 📌 4. Examples

### ✅ Example 1: Convert Strings to Integers

```swift
let strings = ["1", "2", "three", "4"]
let numbers = strings.compactMap { Int($0) }
print(numbers)  // Output: [1, 2, 4]
```

### ✅ Example 2: Remove `nil` Values

```swift
let values: [Int?] = [1, nil, 3, nil, 5]
let nonNilValues = values.compactMap { $0 }
print(nonNilValues)  // Output: [1, 3, 5]
```

---

## 🧾 5. Real-World Use Case

### 🔎 Filtering Valid Emails

```swift
let emails = ["user1@example.com", "", "user2@example.com", nil]
let validEmails = emails.compactMap { $0?.isEmpty == false ? $0 : nil }
print(validEmails)  // Output: ["user1@example.com", "user2@example.com"]
```

---

## 🧪 6. Difference Between `map`, `compactMap`, and `flatMap`

| Function      | Description                                      | Example Result        |
|---------------|--------------------------------------------------|------------------------|
| `map`         | Transforms each element                         | `[Optional<Int>]`     |
| `compactMap`  | Transforms and removes `nil` values              | `[Int]`               |
| `flatMap`     | Flattens one level of nested collections         | `[FlattenedElement]`  |

---

## 🧩 7. Things to Remember

- Use `compactMap` when working with **optionals**.
- It helps to **avoid optional chaining** and unwrapping manually.
- Often used with types like `String?`, `Int?`, custom model objects, etc.

---

## ✅ 8. Summary

- `compactMap` is a concise way to **filter and transform** a collection.
- It removes nils and returns a clean, flattened result.
- Great for safely extracting values from optional data sources.

---
