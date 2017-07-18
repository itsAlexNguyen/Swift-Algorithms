import UIKit

/// Protocol to conform to when creating a Queue
protocol Queuable {
    // Generic Type.
    associatedtype T
    
    // Indicates whether the Queue is empty or not.
    var isEmpty: Bool { get }
    
    // Returns the number of items in the queue.
    var count: Int { get }
    
    // Returns the item in the front of Queue.
    var front: T? { get }
    
    // Adds a new items to the Queue.
    mutating func enqueue(_ element: T)
    
    // Removes next item in the Queue.
    mutating func dequeue() -> T?
    
}

/// Create a Queue that conforms to Queuable
public struct Queue<T>: Queuable {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var front: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> (T)? {
        return isEmpty ? nil : array.removeFirst()
    }
}

// Create a queue and put some elements on it already.
var queueOfNames = Queue(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])

// Adds an element to the end of the queue.
queueOfNames.enqueue("Mike")

// Queue is now ["Carl", "Lisa", "Stephanie", "Jeff", "Wade", "Mike"]
print(queueOfNames.array)

// Remove and return the first element in the queue. This returns "Carl".
queueOfNames.dequeue()

// Return the first element in the queue.
// Returns "Lisa" since "Carl" was dequeued on the previous line.
queueOfNames.front

// Check to see if the queue is empty.
// Returns "false" since the queue still has elements in it.
queueOfNames.isEmpty