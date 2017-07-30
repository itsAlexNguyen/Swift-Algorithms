/// Protocol to conform to when creating an object that performs Binary Search.
protocol BinarySearchable {
    /// Generic Type.
    associatedtype T: Comparable
    
    /**
     This method takes in an Array and performs a Binary Search Algorithm to for an element in an array.
     
     - parameter array: The array to be searched
     - parameter key: The key to be searched for. 
     - parameter range: The range to search.
     */
    func binarySearch(_ array: [T], key: T, range: Range<Int>) -> Int?
}

/// Binary Search Algorithm that uses Recursion.
public class BinarySearchRecursive<T: Comparable>: BinarySearchable {
    func binarySearch(_ array: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            if array[midIndex] > key {
                return binarySearch(array, key: key, range: range.lowerBound ..< midIndex)
            } else if array[midIndex] < key {
                return binarySearch(array, key: key, range: midIndex + 1 ..< range.upperBound)
            } else {
                return midIndex
            }
        }
    }
}

/// Binary Search Algorithm that uses iteration.
public class BinarySearchIterative<T: Comparable>: BinarySearchable {
    func binarySearch(_ array: [T], key: T, range: Range<Int>) -> Int? {
        // We do not need range for iterative approach.
        var lowerBound = 0
        var upperBound = array.count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if array[midIndex] == key {
                return midIndex
            } else if array[midIndex] < key {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
}

// An unsorted array of numbers
let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

// Binary search requires that the array is sorted from low to high
let sorted = numbers.sorted()

// Using recursive solution
BinarySearchRecursive().binarySearch(sorted, key: 2, range: 0 ..< sorted.count)   // gives 0
BinarySearchRecursive().binarySearch(sorted, key: 67, range: 0 ..< sorted.count)  // gives 18
BinarySearchRecursive().binarySearch(sorted, key: 43, range: 0 ..< sorted.count)  // gives 13
BinarySearchRecursive().binarySearch(sorted, key: 42, range: 0 ..< sorted.count)  // nil

// Using iterative solution
BinarySearchIterative().binarySearch(sorted, key: 2, range: 0 ..< sorted.count)   // gives 0
BinarySearchIterative().binarySearch(sorted, key: 67, range: 0 ..< sorted.count)  // gives 18
BinarySearchIterative().binarySearch(sorted, key: 43, range: 0 ..< sorted.count)  // gives 13
BinarySearchIterative().binarySearch(sorted, key: 42, range: 0 ..< sorted.count)  // nil