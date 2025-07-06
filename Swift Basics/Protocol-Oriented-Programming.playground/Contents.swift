/*
 What is Protocol-Oriented Programming in Swift?
 Answer:
    Protocol-Oriented Programming (POP) is a Swift programming paradigm that encourages building systems around protocols (interfaces) rather than class hierarchies.
    Apple introduced POP in Swift 2.0 (WWDC 2015) and emphasized it as a better alternative to traditional OOP using value types (structs) and protocol extensions.
 
 | OOP (Class-based)                 | POP (Protocol + Struct-based)  |
 | --------------------------------- | ------------------------------ |
 | Inheritance-based                 | Composition-based              |
 | Reference types (`class`)         | Value types (`struct`, `enum`) |
 | Risk of tight coupling            | Loosely coupled and modular    |
 | Shared state (mutable references) | Immutability preferred         |
 | Subclassing needed for reuse      | Protocol extensions for reuse  |
 
*/

/*
 key concepts of Protocol-Oriented Programming in Swift:
    1. Protocols: Define a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
    2. Protocol Extensions: Allow you to provide default implementations of methods and properties for protocols, enabling code reuse.
    3. Value Types: Swift encourages the use of structs and enums as value types, which are copied when passed around, reducing side effects.
    4. Protocol Conformance: Types (classes, structs, enums) can conform to protocols, meaning they implement the required methods and properties.
    5. Protocol Composition: You can combine multiple protocols to create a new protocol that inherits the requirements of all combined protocols.
    6. Associated Types: Protocols can define placeholder types that are specified when the protocol is adopted, allowing for more generic and flexible code.
    7. Mutating Methods: In structs, methods can be marked as `mutating` to allow them to modify the properties of the struct.
 */

/*
 Protocol Definition: A protocol defines a blueprint of properties/methods without implementation.
 */
protocol Drivable {
    func startEngine()
    func drive()
}

/*
 Protocol Extension: Provides default implementation for the protocol methods.
    -Eliminates need for subclassing
    -Reduces code duplication
*/
extension Drivable {
    func isEngineStarted() {
        print("Default engine start")
    }
}

/*
 Value Types (Struct) Conforming to Protocol
    -You can also use class, enum, but POP prefers struct for value semantics.
*/
struct Car: Drivable {
    func startEngine() {
        print("Car engine started")
    }
    
    func drive() {
        print("Driving the car")
    }
}

/*
 Protocol Composition: Combining multiple protocols to create a new protocol or use it in a class or struct, enums.
 */
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

/*
 Associated types: This allows generic protocols — common in Swift for dependency injection and abstraction.
 */
protocol Repository {
    associatedtype T
    func save(item: T)
}

/*
 Mutating Methods in Protocols: Since struct is immutable by default, mark protocol methods that mutate state with mutating.
 */
protocol Toggleable {
    mutating func toggle()
}




