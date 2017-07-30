/// Protocol to conform to when creating an object that performs insertion sort.
protocol InsertionSortable {
    /// Generic Type.
    associatedtype T
    
    /**
     This method takes in an Array and performs an Insertion Sort Algorithm to sort the array.
     
     - parameter array: The Array to be sorted.
     - parameter isOrderedBefore: Function to determine the ordering of two generic objects.
     */
    func insertionSort(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T]
}

/// Struct that is able to perform Insertion Sort.
public class InsertionSort<T>: InsertionSortable {
    func insertionSort(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        // If array is 0 or 1, then just return the array because it's sorted already.
        guard array.count > 1 else { return array }
        
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]) {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

InsertionSort().insertionSort(list, <)
InsertionSort().insertionSort(list, >)
