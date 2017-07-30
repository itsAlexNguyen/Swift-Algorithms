/// Protocol to conform to when creating a stack.
protocol Stackable {
    /// Generic Type.
    associatedtype T
    
    /// Returns the number of items in the stack.
    var count: Int { get }
    
    /// Returns with the stack is empty.
    var isEmpty: Bool { get }
    
    /// Returns the top-most items.
    var top: T? { get }
    
    /// Pushes a new item onto the stack.
    mutating func push(_ element: T)
    
    /// Pops the top-most element on the stack, returns said element.
    mutating func pop() -> T?
}

/// Create a stack that conforms to Stackable.
public struct Stack<T>: Stackable {

    fileprivate var array = [T]()
    
    var count: Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
}

// Create a stack and put some elements on it already.
var stackOfNames = Stack(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])

// Add an element to the top of the stack.
stackOfNames.push("Mike")

// The stack is now ["Carl", "Lisa", "Stephanie", "Jeff", "Wade", "Mike"]
print(stackOfNames.array)

// Remove and return the first element from the stack. This returns "Mike".
stackOfNames.pop()

// Look at the first element from the stack.
// Returns "Wade" since "Mike" was popped on the previous line.
stackOfNames.top

// Check to see if the stack is empty.
// Returns "false" since the stack still has elements in it.
stackOfNames.isEmpty
