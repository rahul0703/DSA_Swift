/*
 Q: What is OOPs in swift?
 Answer:
 OOP (Object-Oriented Programming) is a programming paradigm based on the concept of “objects”, which can contain:
    -Properties (data)
    -Methods (functions that operate on data)

 Swift supports all major OOP principles:
    1. Class and Objects
    2. Encapsulation
    3. Inheritance
    4. Polymorphism
    5. Abstraction
 */

//--------------------------------------------------------------------------------------------------
/*
 Class and Objects in swift
    1. Classes: Blueprints for creating objects. They define properties and methods that the objects will have.
    2. Objects: Instances of classes. They are created from classes and can have their own unique data.
 */
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

//--------------------------------------------------------------------------------------------------
/*
 Incapsulation in swift
    1. Encapsulation: Bundling data (properties) and methods that operate on that data into a single unit (class).
    2. Access Control: Swift provides access control levels to control who can see and use your code. In simple terms:
        a. public:  Can be accessed from any other module, but cannot be subclassed or overridden outside the module where it's defined.
        b. private: Can be accessed only within the same class/struct and its extensions if defined in the same scope/file
        c. internal: Default level. Accessible anywhere within the same module (your app or framework).
        d. fileprivate: Accessible anywhere in the same file, even across different types (classes, structs, etc.).
        e. open: Can be accessed and subclassed/overridden from outside modules.
 */
class BankAccount {
    //hiding data using private
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

//--------------------------------------------------------------------------------------------------
/*
 Inheritance in swift
    1. Inheritance: Inheritance allows a class to inherit properties and methods from another class. This promotes code reuse, organization, and helps with polymorphism.
    2. Base Class: The class from which properties and methods are inherited.
        ex: Parent class in the example below
    3. Subclass: The class that inherits from the base class. It can add its own properties and methods or override inherited ones.
        ex: Child class in the example below
    4. Method Overriding: A subclass can provide its own implementation of a method that is already defined in its superclass. This allows for more specific behavior in the subclass.
        ex: The `sayGoodbye` method in the Child class overrides the same method in the Parent class.
    5. Calling superclass methods: A subclass can call methods from its superclass using the `super` keyword. This allows it to extend or modify the behavior of inherited methods.
        ex: The `isEating` method in the Child class calls the superclass method before adding its own behavior.
    6. Inheritance and Initializers: When a subclass inherits from a superclass, it can call the superclass's initializer using `super.init()`. This ensures that the superclass is properly initialized before the subclass adds its own properties or behavior.
        Swift requires all stored properties to be initialized before calling super.init.
    7. final keyword: If you want to prevent a class from being subclassed, you can mark it with the `final` keyword. This means no other class can inherit from it.
 */
class Parent {
    var name:String
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
        //Age must be initialized before calling super.init
        self.age = age
        super.init(name: name) // Calling the superclass initializer
    }
    // Inherits greet() from Parent
    override func sayGoodbye() {
        print("Goodbye from Child")
    }
    override func isEating() {
        super.isEating() // Calling the superclass method
        print("Child is eating")
    }
}
let obj = Child(age: 10, name: "Rahul")
obj.greet() // Output: Hello from Parent
obj.sayGoodbye() // Output: Goodbye from Child
obj.isEating() // Output: is eating \n Child is eating

//--------------------------------------------------------------------------------------------------
/*
 Polimorphism in swift
    1. Polymorphism: Polymorphism means "many forms". It allows different types (usually subclasses) to be treated as one common supertype, typically using a parent class or protocol.
        This helps in:
            1. Writing reusable code
            2. Calling overridden methods at runtime
            3. Working with generic data structures
    2. Types of Polimorphism:
        a. Subtype Polymorphism: class inheritance
        b. Protocol Polymorphism: Protocols with conforming types
        c. Parametric Polymorphism: Generics
        d. Ad-hoc Polymorphism: Function overloading
 */
/*
 Subtype Polymorphism
    - Inheritance allows subclasses to be treated as instances of their superclass.
    - This enables method overriding, where a subclass can provide its own implementation of a method defined in the superclass.
 
    In the example below: Even though animals is of type [Animal], the correct overridden method is called — that’s polymorphism!
 */
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
    animal.makeSound() // Output: Bark, Meow, Bark
}

/*
 Protocol Polymorphism
    - Protocols define a blueprint of methods and properties that conforming types must implement.
    - This allows different types to be treated uniformly if they conform to the same protocol.
 
 Note: This is powerful because Drawable can be implemented by classes, structs, enums — not just subclasses like with class inheritance.
 */
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

/*
 Parametric Polymorphism
    - Generics allow you to write flexible and reusable code that can work with any type.
    - This is achieved by defining functions or types with type parameters.
 */
func printItems<T>(items: [T]) {
    for item in items {
        print(item)
    }
}
printItems(items: [1, 2, 3])         // Works with Int
printItems(items: ["a", "b", "c"])

/*
    Ad-hoc Polymorphism
    - Function overloading allows you to define multiple functions with the same name but different parameter types or counts.
 */
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func add(_ a: String, _ b: String) -> String {
    return a + b
}

