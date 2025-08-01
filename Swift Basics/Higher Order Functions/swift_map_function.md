# Swift Higher-Order Function: `map`

The `map` function is a powerful higher-order function in Swift used to **transform each element in a collection** and return a new collection of results.

---

## 🔷 What is `map`?

- `map` takes a closure as an argument.
- It applies the closure to **each element** of a sequence (e.g., array).
- It returns a **new array** containing the transformed elements.
- The original array is **not modified**.

---

## 🔹 Syntax

```swift
let newArray = oldArray.map { transform($0) }
```

---

## ✅ Basic Example

```swift
let numbers = [1, 2, 3, 4, 5]
let squared = numbers.map { $0 * $0 }
print(squared) // [1, 4, 9, 16, 25]
```

---

## 🔹 Using `map` with Named Functions

```swift
func double(_ number: Int) -> Int {
    return number * 2
}

let nums = [1, 2, 3]
let doubled = nums.map(double)
print(doubled) // [2, 4, 6]
```

---

## 🔹 Mapping to Different Types

```swift
let numbers = [1, 2, 3]
let strings = numbers.map { "Number: \($0)" }
print(strings) // ["Number: 1", "Number: 2", "Number: 3"]
```

---

## 🔹 Mapping Optionals (Optional Chaining + `map`)

```swift
let name: String? = "Swift"
let length = name.map { $0.count }
print(length) // Optional(5)

let empty: String? = nil
let nilLength = empty.map { $0.count }
print(nilLength) // nil
```

---

## 🔹 Nested `map` on 2D Arrays

```swift
let matrix = [[1, 2], [3, 4]]
let doubledMatrix = matrix.map { $0.map { $0 * 2 } }
print(doubledMatrix) // [[2, 4], [6, 8]]
```

---

## 🔹 Mapping Dictionaries

```swift
let dict = ["a": 1, "b": 2]
let keys = dict.map { $0.key }
let values = dict.map { $0.value }
print(keys)   // ["a", "b"]
print(values) // [1, 2]
```

Note: `map` on dictionaries returns an array of tuples if not accessing `.key` or `.value`:

```swift
let tupleArray = dict.map { ($0.key, $0.value * 10) }
// [("a", 10), ("b", 20)]
```

---

## 🔹 Using `map` with Enumerated Arrays

```swift
let items = ["a", "b", "c"]
let indexed = items.enumerated().map { index, value in
    return "\(index): \(value)"
}
print(indexed) // ["0: a", "1: b", "2: c"]
```

---

## 🔹 `map` vs `forEach` vs `compactMap`

| Function     | Purpose                             | Returns a new collection? | Handles nils? |
|--------------|--------------------------------------|----------------------------|---------------|
| `map`        | Transform each element               | ✅ Yes                     | ❌ Keeps nils |
| `forEach`    | Perform side effects (no return)     | ❌ No                      | ❌            |
| `compactMap` | Transform and remove nil results     | ✅ Yes                     | ✅ Removes nils |

---

## 💡 Interview Tips

- Use `map` when you're **transforming** a collection — **not just iterating**.
- Avoid using `map` for side effects — use `forEach` instead.
- Know how to chain `map`, `filter`, `reduce` for functional pipelines.
- Be ready to **convert flat data into structured data** using `map`.

---

## 🧠 Key Points to Remember

- `map` is non-mutating and returns a **new transformed collection**.
- Works on **arrays**, **optionals**, **dictionaries**, and **custom sequences**.
- Use nested `map` for multidimensional arrays.
- `map` is **lazy** when used with `lazy` sequences, useful for large data.

---

Mastering `map` in Swift helps write cleaner, more functional code — a common topic in coding interviews and system design challenges.

