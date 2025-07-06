/*
 LinkedList implementation in swift
 */

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
// Non empty linked list implementation
class LinkedList<T> {
    var head: Node<T>
    
    init(head: Node<T>) {
        self.head = head
    }
    
    func append(value: T) {
        var currentNode = head
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        currentNode.next = Node(value: value)
    }
    
    func printList() {
        var currentNode: Node? = head
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
}

// Example usage:
let firstNode = Node(value: 1)
let linkedList = LinkedList(head: firstNode)
linkedList.append(value: 2)
linkedList.append(value: 3)
linkedList.printList() // Output: 1 -> 2 -> 3 -> nil


//Empty linked list implementation
class EmptyLinkedList<T> {
    var head: Node<T>?

    init() {
        self.head = nil
    }

    func append(value: T) {
        let newNode = Node(value: value)
        if let head = head {
            var currentNode = head
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            currentNode.next = newNode
        } else {
            self.head = newNode
        }
    }

    func printList() {
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
}
