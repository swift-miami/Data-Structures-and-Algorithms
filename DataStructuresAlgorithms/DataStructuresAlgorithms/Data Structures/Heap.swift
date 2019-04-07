/**
 # Min Heap
 
 Parent nodes must contain a value less than or equal to its children.
 The root node will always contain the smallest element.
 
 A heap is a complete binary tree.
 
        * A *                   * B *
 
         10                      10
      /      \               /       \
    20        100          30         15
   /                      /  \       /  \
 30                     40    52   100   41
                       /  \
                     42   51
 
 Heap B levels:
 1: 10
 2: 30, 15
 3: 40, 52, 100, 41
 4: 42, 51
 
 Heap B can be represented as an array:
 let heapB = [10, 30, 15, 40, 52, 100, 41, 42, 51]
 
 ## Heap applications:
 - Getting the min or max element
 - Heap sort
 - Constructing priority queues
    - Constructing graph algorithms
        - Prim's
        - Dijkstra's
 
 Given a node at a zero-based index i:
 - The left child of this node can be found at index 2i + 1
 - The right child of this node can be found at index 2i + 2
 
 Given a node at index i, it's parent node can be found at index:
- floor( (i - 1) / 2 )
 
 https://www.raywenderlich.com/586-swift-algorithm-club-heap-and-priority-queue-data-structure
 */

struct Heap<T: Comparable> {
    
    private var elements: [T] = []
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    // Left child index of parent at index
    private func leftChildIndex(for parentIndex: Int) -> Int? {
        
        // The left child of this node can be found at index 2i + 1
        let leftIndex = (2 * parentIndex) + 1
        
        // Prevent index overflow
        guard leftIndex < elements.count else { return nil }
        
        return leftIndex
    }
    
    // Right child index of parent at index
    private func rightChildIndex(for parentIndex: Int) -> Int? {
        
        // The right child of this node can be found at index 2i + 2
        let rightIndex = (2 * parentIndex) + 2
        
        // Prevent index overflow
        guard rightIndex < elements.count else { return nil }
        
        return rightIndex
    }
    
    // Parent index given a children index
    private func parentIndex(at childIndex: Int) -> Int? {
        
        // Given a node at index i, it's parent node can be found at index:
        let parentIndex = (childIndex - 1) / 2
        
        // Prevent index overflow
        guard parentIndex < elements.count else { return nil }
        
        return parentIndex
    }
    
    mutating func insert(value: T) {
        // Step 1: Append element to the end (Keeps tree balanced).
        elements.append(value)
        
        // Step 2: Bubble up if possible.
        func bubbleUpElement(at index: Int) {
            // I get this index' parent
            guard let parentIdx = parentIndex(at: index) else { return }
            
            // Keep bubbling up until the new value is smaller than its child
            if elements[parentIdx] > elements[index] {
                elements.swapAt(parentIdx, index)
                bubbleUpElement(at: parentIdx)
            }
        }
        
        bubbleUpElement(at: elements.count - 1)
    }
    
    mutating func pop() -> T? {
        let firstValue = elements.first
        
        let lastIndex = elements.count - 1
        elements.swapAt(0, lastIndex)
        elements.remove(at: lastIndex)
        
        func bubbleDown(at index: Int) {
            // Return if there's no left (No right if there's no left)
            guard let leftIndex = leftChildIndex(for: index) else { return }
            
            if let rightIndex = rightChildIndex(for: index),
                elements[rightIndex] > elements[leftIndex] {
                
                elements.swapAt(rightIndex, index)
                bubbleDown(at: rightIndex)
                
            } else {
                elements.swapAt(leftIndex, index)
                bubbleDown(at: leftIndex)
            }
        }
        
        bubbleDown(at: 0)
        
        return firstValue
    }
}

extension Heap: CustomStringConvertible {
    var description: String {
        var lineNumber = 0
        var lines: [[T]] = [[]]
        var limit = 1
        for element in elements {
            if lines[lineNumber].count == limit {
                lines.append([])
                lineNumber += 1
                limit = limit * 2
            }
            lines[lineNumber].append(element)
        }

        return lines
            .enumerated()
            .map { index, next in
                var line = "\(index + 1): "
                line += "\(next.map { "\($0)" }.joined(separator: ", "))"
                return line
            }
            .joined(separator: "\n")
    }
}
