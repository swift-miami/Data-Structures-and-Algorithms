extension Heap {

    /// find the nth smallest item in an unsorted array
    static func findNthSmallest(n: Int, in array: [T]) -> T? {
        guard array.isEmpty == false,
            n <= array.count else { return nil }

        var heap = Heap(with: array)
        var value: T?
        for _ in 0..<n {
            value = heap.pop()
        }
        return value
    }

    /// Given an array, test if it is a heap
    static func isMinHeap(array: [T]) -> Bool {
        let heap = Heap(with: array)
        return heap.asArray == array
    }

}

