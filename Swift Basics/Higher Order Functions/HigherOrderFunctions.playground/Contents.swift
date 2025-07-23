import Foundation

/*
 In Swift, higher-order functions are functions that either:
 Take another function as an argument, or
 Return a function, or
 Both.

 These are mainly used on collections like Array, Set, Dictionary, and even Optional, providing a clean and expressive way to perform operations like transformation, filtering, reducing, etc.
 */

//------------------------------------------------------------------------------------------------

/*
 Map
 The map keyword in Swift is a high-order function that allows you to transform elements of a collection (like an array or a dictionary) by applying a closure (function) to each element.
 It returns a new collection with the results of the transformation, without modifying the original collection.
 */
var oldArray: [Int] = [1, 2, 3, 4, 5]
let transformedElement = 10 // Example transformation, can be any operation
let newArray = oldArray.map { element in
    return transformedElement
}
newArray // [10, 10, 10, 10, 10]

//Another way to write the same code using shorthand argument names
//let newArray = oldArray.map { $0.transformation }

//Example 1: Array of Integers
var numbers = [1, 2, 3, 4]
let squares = numbers.map { $0 * $0 }
print(squares)  // [1, 4, 9, 16]

//Example 2: String Transformation
var names = ["alice", "bob", "charlie"]
let capitalized = names.map { $0.capitalized }
print(capitalized)  // ["Alice", "Bob", "Charlie"]

//Example 3: Working with Structs
struct User {
    let name: String
    let age: Int
}

let users = [
    User(name: "Rahul", age: 26),
    User(name: "Neha", age: 30)
]

names = users.map { $0.name }
print(names)  // ["Rahul", "Neha"]

//Example 4: Dictionary Map
let cities = ["IN": "India", "US": "United States"]
let uppercased = cities.map { key, value in
    (key, value.uppercased())
}
print(uppercased)  // [("IN", "INDIA"), ("US", "UNITED STATES")]
//Note: map on dictionary returns an array of tuples, not a dictionary.

//------------------------------------------------------------------------------------------------


/*
 Compact Map
 compactMap is a higher-order function used to:
    1. Transform elements of a collection, similar to map.
    2. Filter out nil values from the result.
 */

//Example 1: Filtering nil values
let strings = ["1", "2", "abc", "3"]
numbers = strings.compactMap { Int($0) }
// ["abc"] is skipped → [1, 2, 3]


//Example 2: Transforming and filtering nil values
var values: [Int?] = [1, nil, 3, nil, 5]
var nonNils = values.compactMap { $0 }
// [1, 3, 5]

//Example 3: Using compactMap with Optional values in struct
struct UserCompactMap {
    let name: String
    let age: Int?
}

let userCompactMap = [
    UserCompactMap(name: "Alice", age: 25),
    UserCompactMap(name: "Bob", age: nil),
    UserCompactMap(name: "Charlie", age: 30)
]

let validAges = userCompactMap.compactMap { $0.age }
// [25, 30]


//Example 4: Transform + Filter Together
let items = ["apple", "banana", "car", "dog"]

// Only return items that contain "a" and convert to uppercased
let result = items.compactMap { $0.contains("a") ? $0.uppercased() : nil }
// ["APPLE", "BANANA", "CAR"]


//Example 5: Using compactMap with Dictionary
//Note: When using on Dictionary.map or compactMap, remember it returns an array of results:
let dict = ["a": "1", "b": "abc", "c": "2"]

let validInts = dict.compactMap { (key, value) in
    Int(value)
}

//------------------------------------------------------------------------------------------------

/*
 Flat Map
    flatMap is a higher-order function that combines the functionality of map and compactMap.
    It transforms each element of a collection and flattens the result into a single collection, removing any nil values.
 */

//Example 1: Flattening an array of arrays
let data = [[1, 2], [3, 4], [5]]
let flat = data.flatMap { $0 }
// [1, 2, 3, 4, 5]

//Example 2: String to Integer Conversion and Flattening
var valuesFlatMap = ["1", "2", "abc", "4"]
let flatMap = valuesFlatMap.flatMap { Int($0) }
// [1, 2, 4]

//-----------------------------------------------------------------------------------------

/*
    Filter
    The filter keyword in Swift is a higher-order function that allows you to create a new collection containing only the elements that satisfy a specified condition.
    It does not modify the original collection.
 */


//Example 1: Filter Even Numbers
numbers = [1, 2, 3, 4, 5, 6]
let evens = numbers.filter { $0 % 2 == 0 }
// [2, 4, 6]


//Example 2: Filter Strings
let fruits = ["apple", "banana", "avocado", "kiwi"]
let aFruits = fruits.filter { $0.hasPrefix("a") }
// ["apple", "avocado"]


//Example 3: Filter Structs by Property
struct FilterUser {
    let name: String
    let isActive: Bool
}

let userFilter = [
    FilterUser(name: "Alice", isActive: true),
    FilterUser(name: "Bob", isActive: false),
    FilterUser(name: "Charlie", isActive: true)
]

let activeUsers = userFilter.filter { $0.isActive }
// [User(name: "Alice", ...), User(name: "Charlie", ...)]


//Example 4: Filter on Dictionary
let ages = ["Alice": 30, "Bob": 15, "Charlie": 25]

let adults = ages.filter { $0.value >= 18 }
// [("Alice", 30), ("Charlie", 25)]

//-----------------------------------------------------------------------------------------

/*
 Reduce
 reduce function is a powerful higher-order function used to combine all elements of a collection into
 a single value (like a sum, product, string, or even a complex object).
 */

// Example 1: Sum of an Array
numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum)  // Output: 15
/*
 0 is the initial value.
$0 is the running total (partial result).
$1 is the current element.
 */

// Example 2: Concatenating Strings
var concatStrings = ["Swift", "is", "awesome"]
let sentence = concatStrings.reduce("") { $0 + " " + $1 }
print(sentence)  // Output: " Swift is awesome"

//



