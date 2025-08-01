# Swift Closures

Closures are self-contained blocks of functionality that can be passed around and used in your code. They are similar to blocks in C and Objective-C and lambdas in other programming languages.

## 🔹 Syntax

Closures can capture and store references to variables and constants from the context in which they are defined. The basic syntax is:

```swift
{ (parameters) -> returnType in
    // code
}
```

## 🔹 Closure Types

### 1. **Non-Escaping Closures**

Non-escaping closures are passed into a function and are executed before the function returns. These are the default in Swift.

```swift
func performTask(task: () -> Void) {
    task() // Executed before the function ends
}

performTask {
    print("Task is done!")
}
```

🔸 **Note:** You don’t need to annotate the closure with `@escaping`.

---

### 2. **Escaping Closures**

Escaping closures are stored to be called later (e.g., in asynchronous operations). You must annotate the parameter with `@escaping`.

```swift
var completionHandlers: [() -> Void] = []

func addCompletionHandler(handler: @escaping () -> Void) {
    completionHandlers.append(handler)
}

// Example usage
addCompletionHandler {
    print("This will be called later.")
}
```

🔸 **Note:** Escaping closures may require `[weak self]` to prevent retain cycles in classes.

---

### 3. **Trailing Closures**

If a closure is the last parameter in a function, you can use trailing closure syntax for cleaner code.

```swift
func downloadData(completion: () -> Void) {
    // download logic
    completion()
}

// Trailing closure syntax
downloadData {
    print("Download complete.")
}
```

---

### 4. **Autoclosures**

Autoclosures automatically wrap an expression in a closure. Commonly used to delay execution of a parameter expression.

```swift
func logIfTrue(_ condition: @autoclosure () -> Bool) {
    if condition() {
        print("Condition is true")
    }
}

// Usage
logIfTrue(2 > 1) // Automatically wrapped in closure
```

🔸 **Note:** Use sparingly — best for syntactic sugar.

---

### 5. **Capturing Values**

Closures can capture and store references to variables outside their body.

```swift
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    return {
        total += incrementAmount
        return total
    }
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo()) // 2
print(incrementByTwo()) // 4
```

---

## 🔹 Practical Tips

- Use `[weak self]` or `[unowned self]` in escaping closures to avoid memory leaks.
- Closures are **reference types**.
- You can assign closures to variables or pass them as parameters.

---

## 🔹 Closure Shorthand Argument Names

Swift provides shorthand argument names like `$0`, `$1`, etc., for inline closures.

```swift
let numbers = [1, 2, 3]
let doubled = numbers.map { $0 * 2 }
print(doubled) // [2, 4, 6]
```

---

## 🔹 @escaping vs non-escaping: Visual Summary

| Type         | Escapes Function Scope? | Requires Annotation? | Use Case Example             |
|--------------|--------------------------|------------------------|------------------------------|
| Non-Escaping | ❌ No                    | ❌ No                  | Synchronous tasks            |
| Escaping     | ✅ Yes                   | ✅ Yes (`@escaping`)   | Asynchronous callbacks       |

---

## 🔹 Closure as Completion Handler Example

```swift
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        let data = "Data from server"
        DispatchQueue.main.async {
            completion(data)
        }
    }
}

fetchData { result in
    print("Result: \(result)")
}
```

---

## 📌 Summary

Closures are powerful and flexible. Key points to remember:

- Closures can capture values and context.
- Use `@escaping` when a closure needs to outlive the function call.
- Trailing and shorthand syntax improves readability.
- Be cautious of retain cycles in escaping closures with `self`.
