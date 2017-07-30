/// Protocol to conform to when creating a Binary Search Tree
protocol BinarySearchTreeable {
    /// Generic Type.
    associatedtype T: Comparable
    
    ///The value of the particular node.
    var value: T { get }
    
    /// The tree of the parent node.
    var parent: Self? { get }
    
    /// The tree of the left node.
    var left: Self? { get }
    
    /// The tree of the right node.
    var right: Self? { get }
    
    /// Indicates whether this is the root node.
    var isRoot: Bool { get }
    
    /// Indicates whether this is the lead node.
    var isLeaf: Bool { get }
    
    /// Indicates whether this is a left child.
    var isLeftChild: Bool { get }
    
    /// Indicates whether this is a right child.
    var isRightChild: Bool { get }
    
    /// Indicates whether this node has a left child.
    var hasLeftChild: Bool { get }
    
    /// Indicates whether this node has a right child.
    var hasRightChild: Bool { get }
    
    /// Indicates whether this node has any children.
    var hasAnyChild: Bool { get }
    
    /// Indicates whether this node has both children.
    var hasBothChildren: Bool { get }
    
    /// How many nodes are in this subtree. Performance: O(n).
    var count: Int { get }
    
    // MARK: - Adding items
    
    /**
     Inserts a new element into the tree. You should only insert elements
     at the root, to make to sure this remains a valid binary tree!
     Performance: runs in O(h) time, where h is the height of the tree.
     */
    func insert(value: T)
    
    
    
    // MARK: - Deleting items
    
    /*
     Deletes a node from the tree.
     Returns the node that has replaced this removed one (or nil if this was a
     leaf node). That is primarily useful for when you delete the root node, in
     which case the tree gets a new root.
     Performance: runs in O(h) time, where h is the height of the tree.
     */
    func remove() -> Self?
    
    // MARK: - Searching
    
    /**
     Finds the "highest" node with the specified value.
     Performance: runs in O(h) time, where h is the height of the tree.
     */
    func search(value: T) -> Self?
    
    /// Indicates whether the tree contains a certain value.
    func contains(value: T) -> Bool
    
    /// Returns the leftmost descendent. O(h) time.
    func minimum() -> Self
    
    /// Returns the rightmost descendent. O(h) time.
    func maximum() -> Self
    
    /*
     Calculates the depth of this node, i.e. the distance to the root.
     Takes O(h) time.
     */
    func depth() -> Int
    
    /*
     Finds the node whose value precedes our value in sorted order.
     */
    func predecessor() -> Self?
    
    /*
     Finds the node whose value succeeds our value in sorted order.
     */
    func successor() -> Self?
    
    // MARK: - Traversal
    
    func traverseInOrder(process: (T) -> Void)
    
    func traversePreOrder(process: (T) -> Void)
    
    func traversePostOrder(process: (T) -> Void)
    
    /*
     Performs an in-order traversal and collects the results in an array.
     */
    func map(formula: (T) -> T) -> [T]
    
}

public class BinarySearchTree<T>: BinarySearchTreeable {
    
}

