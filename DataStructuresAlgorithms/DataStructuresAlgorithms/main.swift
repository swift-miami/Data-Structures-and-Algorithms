import Foundation

func testPop() {
    var heap = Heap<Int>()
    heap.insert(value: 10)
    heap.insert(value: 30)
    heap.insert(value: 15)
    heap.insert(value: 40)
    heap.insert(value: 52)
    heap.insert(value: 100)
    heap.insert(value: 41)
    heap.insert(value: 42)
    heap.insert(value: 51)

    print("\(heap)\n\n")

    var poppedValue = heap.pop()
    assert(poppedValue == 10, "expected: 10\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 15, "expected: 15\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 30, "expected: 30\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 40, "expected: 40\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 41, "expected: 41\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 42, "expected: 42\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 51, "expected: 51\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 52, "expected: 52\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == 100, "expected: 100\tgot: \(poppedValue!)")
    print("\(heap)\n\n")

    poppedValue = heap.pop()
    assert(poppedValue == nil, "expected: nil\tgot: \(poppedValue)")
    print("\(heap)\n\n")
}

//testPop()


