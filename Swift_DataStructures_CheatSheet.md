# 📄 Swift Data Structures and Comparators Cheat Sheet

---

## 1. Arrays in Swift

```swift
var arr = [1, 2, 3, 4]
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `arr.append(5)` | Adds an element to the end | O(1) amortized |
| `arr.insert(0, at: 0)` | Inserts element at index | O(n) |
| `arr.remove(at: 2)` | Removes element at index | O(n) |
| `arr[1]` | Accesses element at index | O(1) |
| `arr.count` | Gets array length | O(1) |
| `arr.contains(3)` | Checks if array contains value | O(n) |
| `arr.sort()` | Sorts in ascending order | O(n log n) |
| `arr.reverse()` | Reverses the array | O(n) |
| `for item in arr {}` | Iterates over array | O(n) |

---

## 2. Stack in Swift (Using Array)

```swift
var stack: [Int] = []
stack.append(1) // push
_ = stack.popLast() // pop
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `stack.append(x)` | Pushes an element | O(1) |
| `stack.popLast()` | Pops top element | O(1) |
| `stack.last` | Peeks top element | O(1) |
| `stack.isEmpty` | Checks if stack is empty | O(1) |

---

## 3. Queue in Swift (Using Two Stacks)

```swift
struct EfficientQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

    mutating func enqueue(_ element: T) {
        inbox.append(element)
    }

    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }

    func peek() -> T? {
        return outbox.isEmpty ? inbox.first : outbox.last
    }

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
}
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `enqueue(x)` | Adds to queue | O(1) |
| `dequeue()` | Removes from front | O(1) amortized |
| `peek()` | Peeks front element | O(1) |
| `isEmpty` | Checks if queue is empty | O(1) |

---

## 4. LinkedList in Swift

```swift
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `ListNode(5)` | Creates a node | O(1) |
| `node.next = anotherNode` | Links to next node | O(1) |
| `while node != nil {}` | Traverses list | O(n) |
| `node.val` | Accesses node value | O(1) |

---

## 5. PriorityQueue in Swift (Using Binary Heap)

```swift
struct PriorityQueue<T: Comparable> {
    private var heap = [T]()

    var isEmpty: Bool { heap.isEmpty }
    var peek: T? { heap.first }

    mutating func enqueue(_ element: T) {
        heap.append(element)
        siftUp(heap.count - 1)
    }

    mutating func dequeue() -> T? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let item = heap.removeLast()
        siftDown(0)
        return item
    }

    private mutating func siftUp(_ index: Int) {
        var child = index, parent = (child - 1) / 2
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1, right = 2 * parent + 2
            var candidate = parent
            if left < heap.count && heap[left] > heap[candidate] { candidate = left }
            if right < heap.count && heap[right] > heap[candidate] { candidate = right }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `enqueue(x)` | Inserts into heap | O(log n) |
| `dequeue()` | Removes top element | O(log n) |
| `peek` | Peeks top element | O(1) |
| `isEmpty` | Checks if empty | O(1) |

---

## 6. Dictionary in Swift

```swift
var dict = ["a": 1, "b": 2]
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `dict["c"] = 3` | Adds or updates key-value | O(1) |
| `dict["a"]` | Accesses value by key | O(1) |
| `dict.removeValue(forKey: "b")` | Removes a key | O(1) |
| `dict.keys` | Gets all keys | O(n) |
| `dict.values` | Gets all values | O(n) |
| `dict.isEmpty` | Checks if empty | O(1) |
| `dict.count` | Gets number of pairs | O(1) |

---

## 7. Set in Swift

```swift
var s: Set = [1, 2, 3]
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `s.insert(4)` | Inserts a value | O(1) |
| `s.remove(2)` | Removes a value | O(1) |
| `s.contains(3)` | Checks for existence | O(1) |
| `s.union([4,5])` | Combines sets | O(n) |
| `s.intersection([2,3])` | Common elements | O(n) |
| `s.isEmpty` | Checks if set is empty | O(1) |

---

## 8. Comparable and Comparator in Swift

### Conforming to `Comparable`

```swift
struct Person: Comparable {
    let name: String
    let age: Int
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `static func <` | Defines less-than logic | O(1) |
| `==` | Equatable conformance | O(1) |
| `array.sort()` | Uses `<` for sorting | O(n log n) |

### Using `sort(by:)` for Custom Comparators

```swift
let nums = [5, 3, 8]
let sorted = nums.sorted(by: { $0 > $1 })
```

| Syntax | Description | Time Complexity |
|--------|-------------|-----------------|
| `sorted(by: <)` | Sorts using custom logic | O(n log n) |
| `{ $0.property < $1.property }` | Custom comparator | O(1) per comparison |
| `array.sorted()` | Sorts based on `Comparable` | O(n log n) |