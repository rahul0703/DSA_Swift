/*
 Closures in Swift — one of the most commonly asked interview topics and also very powerful and flexible features in Swift.
 
 Closures: Closures are self-contained blocks of functionality that can be passed around and used in your code. They are similar to lambdas or anonymous functions in other languages.
 
 🔍 Why Use Closures?
    -Pass functionality as arguments to functions.
    -Capture and store references from surrounding context.
    -Clean syntax for asynchronous calls, completion handlers, and event callbacks.
    -Used extensively in SwiftUI, UICollectionView/UITableView delegates, etc.
 */

//----------------------------------------------------------------------------------------------

/*
🧠Closure Syntex
 */

//Basic Syntex
let greeting = {
    print("Hello, Swift!")
}
greeting()

//Closure with Parameters
let square = { (number: Int) -> Int in
    return number * number
}
print(square(5)) // Output: 25

//Closure as a Function Parameter
func performOperation(_ operation: () -> Void) {
    operation()
}
performOperation {
    print("Executing Operation")
}

//Trailing Closure Syntax
func loadData(completion: () -> Void) {
    print("Loading data...")
    completion()
}
loadData {
    print("Data Loaded")
}

//Returning Closures from Functions
func makeIncrementer(by amount: Int) -> (Int) -> Int {
    return { number in
        return number + amount
    }
}
let addFive = makeIncrementer(by: 5)
print(addFive(10)) // Output: 15

//Closure Capturing Values
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}
let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2

//------------------------------------------------------------------------------------------------

/*
 Closure expressions
 */

//Full syntax
let numbers = [3, 1, 4, 2]
let sorted = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
    return a < b
})

//Inferred types
let sortedInferred = numbers.sorted(by: { a, b in a < b })

//Shorthand argument names:
let sortedShorthand = numbers.sorted(by: { $0 < $1 })

//Trailing closure
let sortedTrailing = numbers.sorted { $0 < $1 }

