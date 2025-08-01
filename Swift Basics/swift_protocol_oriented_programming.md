# Protocol-Oriented Programming (POP) in Swift

Protocol-Oriented Programming is a powerful paradigm introduced by Apple with Swift 2.0, promoting the use of **protocols** and **value types** (like `struct` and `enum`) over classical inheritance and reference types (`class`).

---

## ❓ What is Protocol-Oriented Programming in Swift?

**Answer:**  
Protocol-Oriented Programming (POP) encourages building systems around **protocols** rather than class hierarchies. It emphasizes **composition over inheritance**, **value semantics**, and **code reuse via protocol extensions**.

| OOP (Class-based)                 | POP (Protocol + Struct-based)  |
|----------------------------------|--------------------------------|
| Inheritance-based                | Composition-based              |
| Reference types (`class`)        | Value types (`struct`, `enum`) |
| Risk of tight coupling           | Loosely coupled and modular    |
| Shared state (mutable references)| Immutability preferred         |
| Subclassing needed for reuse     | Protocol extensions for reuse  |

---

## 🔹 Key Concepts of Protocol-Oriented Programming

### 1. Protocols
Protocols define a blueprint of properties, methods, and functionality that conforming types must implement.

```swift
protocol Drivable {
    func startEngine()
    func drive()
}
```

---

### 2. Protocol Extensions
Protocol extensions provide **default implementations** for protocol requirements, enabling code reuse without inheritance.

```swift
extension Drivable {
    func isEngineStarted() {
        print("Default engine start")
    }
}
```

---

### 3. Value Types
Swift favors `struct` and `enum` over `class`, which are **value types** — copied rather than referenced — promoting safer, predictable code.

```swift
struct Car: Drivable {
    func startEngine() {
        print("Car engine started")
    }

    func drive() {
        print("Driving the car")
    }
}
```

---

### 4. Protocol Conformance
Any type (`class`, `struct`, `enum`) can conform to protocols by implementing the required methods and properties.

---

### 5. Protocol Composition
You can combine multiple protocols into one or use multiple protocols together for flexible and modular designs.

```swift
protocol MusicPlayable {
    func playMusic()
}

protocol SmartVehicle: Drivable, MusicPlayable {
    func autoPark()
}

struct SmartCar: Drivable, MusicPlayable {
    func startEngine() { print("SmartCar engine started") }
    func drive() { print("SmartCar driving") }
    func playMusic() { print("Playing music") }
}
```

---

### 6. Associated Types
Protocols can use `associatedtype` to define placeholders for types, enabling **generic** and flexible protocol designs.

```swift
protocol Repository {
    associatedtype T
    func save(item: T)
}
```

---

### 7. Mutating Methods
In structs, methods that modify properties must be marked `mutating`. Protocols must reflect this requirement.

```swift
protocol Toggleable {
    mutating func toggle()
}
```

---

## ✅ Summary

Protocol-Oriented Programming in Swift is:

- Safer and more modular than classical inheritance
- A better fit for **value types**
- Centered around **protocols**, **composition**, and **default behavior**
- Extensible, testable, and aligned with Swift’s design philosophy

Mastering POP is essential for modern Swift development.

