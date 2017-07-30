/// A Protocol to define an object that can perform Merge Sort.
protocol MergeSortable {
    /// Generic Type.
    associatedtype T: Comparable
    
    /**
     This method takes in an Array and performs a Merge Sort and returns a sorted array.
     
     - parameter array: The array to be sorted
     */
    func mergeSort(_ array: [T]) -> [T]
}

public class MergeSort<T: Comparable>: MergeSortable {
    
    func mergeSort(_ array: [T]) -> [T] {
        // Check if we only have one element
        guard array.count > 1 else { return array }
        
        // Prepare piles
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        // Recursion
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    /**
     This method merges two arrays and ensures the final array is sorted.
     
     - parameter leftPile: The left pile to be merged.
     - parameter rightPile: The right pile to be merged.
     */
    private func merge(leftPile: [T], rightPile: [T]) -> [T] {
        // Arrange required varaibles
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = [T]() // Final pile to return
        
        // Iterate through both piles, look for the smaller element and add to pile.
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        // In the case we go through one pile first, we need to append the rest of the elements in the other pile.
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
}

public class MergeSortBottomUp<T: Comparable>: MergeSortable {
    func mergeSort(_ array: [T]) -> [T] {
        return mergeSortButtomUp(array, <)
    }
    
    private func mergeSortButtomUp(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        var z = [a, a]   // the two working arrays
        var d = 0        // z[d] is used for reading, z[1 - d] for writing
        var width = 1
        while width < n {
            
            var i = 0
            while i < n {
                
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                
                i += width*2
            }
            
            width *= 2   // in each step, the subarray to merge becomes larger
            d = 1 - d    // swap active array
        }
        return z[d]
    }
}

let array = [2, 1, 5, 4, 9]
let sortedArray = MergeSort().mergeSort(array)
let array2 = ["Tom", "Harry", "Ron", "Chandler", "Monica"]
let sortedArray2 = MergeSort().mergeSort(array2)
