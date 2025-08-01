# Swift and Object-Oriented Programming (OOP)

This document explores how Swift supports Object-Oriented Programming concepts along with examples and explanations.

---

## ❓ Is Swift a Completely OOP Language?

**Answer:**  
No, Swift is not a completely Object-Oriented Programming (OOP) language. It is a **multi-paradigm language**, supporting:

- Object-Oriented Programming
- Functional Programming
- **Protocol-Oriented Programming (POP)** — Swift’s unique emphasis on protocols over classes

---

## ❓ What is OOP in Swift?

**Object-Oriented Programming (OOP)** is a paradigm based on the concept of objects which can contain:

- **Properties** (data)
- **Methods** (functions that operate on data)

Swift supports all major OOP principles:

1. Class and Objects  
2. Encapsulation  
3. Inheritance  
4. Polymorphism  
5. Abstraction  

---

## 🔹 1. Classes and Objects in Swift

**Classes** are blueprints for objects.  
**Objects** are instances of classes with their own unique data.

```swift
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func greet() {
        print("Hello, my name is \(name)")
    }
}

let person1 = Person(name: "Rahul", age: 25)
person1.greet() // Hello, my name is Rahul
```

---

## 🔹 2. Encapsulation in Swift

Encapsulation bundles properties and methods into one unit and restricts direct access to internal state.

Swift uses **Access Control**:

- `public` – visible outside the module
- `private` – visible only inside the same class
- `internal` – default; accessible within the module
- `fileprivate` – accessible within the same file
- `open` – public + subclassable/overridable outside module

```swift
class BankAccount {
    private var balance: Double = 0.0

    func deposit(amount: Double) {
        balance += amount
    }

    func getBalance() -> Double {
        return balance
    }
}

let myAccount = BankAccount()
myAccount.deposit(amount: 1000)
print(myAccount.getBalance()) // 1000
```

---

## 🔹 3. Inheritance in Swift

Allows a class to inherit properties and methods from another.

```swift
class Parent {
    var name: String
    init(name: String) {
        self.name = name
    }
    func greet() {
        print("Hello from Parent")
    }
    func sayGoodbye() {
        print("Goodbye from Parent")
    }
    func isEating() {
        print("is eating")
    }
}

class Child: Parent {
    var age: Int
    init(age: Int, name: String) {
        self.age = age
        super.init(name: name)
    }

    override func sayGoodbye() {
        print("Goodbye from Child")
    }

    override func isEating() {
        super.isEating()
        print("Child is eating")
    }
}

let obj = Child(age: 10, name: "Rahul")
obj.greet()
obj.sayGoodbye()
obj.isEating()
```

---

## 🔹 4. Polymorphism in Swift

**Polymorphism** = "many forms" – allows subclasses or types to be used interchangeably with their parent types.

### Subtype Polymorphism
```swift
class Animal {
    func makeSound() {
        print("Some animal sound")
    }
}
class Dog: Animal {
    override func makeSound() {
        print("Bark")
    }
}
class Cat: Animal {
    override func makeSound() {
        print("Meow")
    }
}
let animals: [Animal] = [Dog(), Cat(), Dog()]
for animal in animals {
    animal.makeSound()
}
```

### Protocol Polymorphism
```swift
protocol Drawable {
    func draw()
}
class Circle: Drawable {
    func draw() {
        print("Drawing a circle")
    }
}
class Rectangle: Drawable {
    func draw() {
        print("Drawing a rectangle")
    }
}
let shapes: [Drawable] = [Circle(), Rectangle()]
for shape in shapes {
    shape.draw()
}
```

### Parametric Polymorphism (Generics)
```swift
func printItems<T>(items: [T]) {
    for item in items {
        print(item)
    }
}
printItems(items: [1, 2, 3])
printItems(items: ["a", "b", "c"])
```

### Ad-hoc Polymorphism (Function Overloading)
```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func add(_ a: String, _ b: String) -> String {
    return a + b
}
```

---

## 🔹 5. Abstraction in Swift

**Abstraction** hides complex details and exposes only essential parts.

### Achieved using:
- Abstract base classes (via protocols)
- Access modifiers (`private`, `internal`)
- Protocols defining interfaces

```swift
protocol Vehicle {
    func start()
}

class Car: Vehicle {
    func start() {
        print("Car starting")
    }
}
```

---

## ✅ Summary

Swift supports all key OOP principles:
- ✅ Classes & Objects
- ✅ Encapsulation (with access control)
- ✅ Inheritance (with overrides, `super`, `final`)
- ✅ Polymorphism (subtype, protocol, generics, overloading)
- ✅ Abstraction (protocols, access modifiers)

Plus: Swift adds powerful **Protocol-Oriented Programming** to go beyond traditional OOP.

