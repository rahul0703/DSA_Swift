/*
 As swift doesn't have a built-in queue data structure, we can implement a efficient queue using 2 stacks
 */

struct stackQueue<T> {
    var inbox:[T] = []
    var outbox:[T] = []

    //mutating indicates that the method is permitted to modify the instance it belongs
    mutating func enqueue(_ element: T) {
        inbox.append(element) // Add element to the inbox stack
    }
    
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed() // Reverse the inbox stack to the outbox stack
            inbox.removeAll() // Clear the inbox stack
        }
        return outbox.popLast() // Remove and return the last element from the outbox stack
    }
    
    func isEmpty() -> Bool {
        return inbox.isEmpty && outbox.isEmpty // Check if both stacks are empty
    }
    
    func peek() -> T? {
        outbox.last ?? inbox.first // Return the last element of outbox or first of inbox if outbox is empty
    }
}





