import Foundation


// MARK: - Data Structure

// test .pop
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

// test .insert
public struct Person: Equatable, Comparable {
    let name: String
    let age: Int
    let isMilitary: Bool

    public static func < (lhs: Person, rhs: Person) -> Bool {
        if lhs.isMilitary && !rhs.isMilitary {
            return false
        }
        else if !lhs.isMilitary && rhs.isMilitary {
            return true
        }

        return lhs.age < rhs.age
    }
}

let charles = Person(name: "5", age: 75, isMilitary: true)
let danielle = Person(name: "4", age: 28, isMilitary: true)
let bob = Person(name: "3", age: 27, isMilitary: true)
let erick = Person(name: "2", age: 78, isMilitary: false)
let amy = Person(name: "1", age: 12, isMilitary: false)

let people = [amy, bob, charles, danielle, erick]
var peopleHeap = Heap(with: people)

let expectedSortedPeople = [amy, erick, bob, danielle, charles]
var heapSortedPeople: [Person] = []

print(peopleHeap)
print("\n\n")

for _ in 0..<peopleHeap.count {
    heapSortedPeople.append(peopleHeap.pop()!)
    print(peopleHeap)
    print("\n\n")
}
assert(expectedSortedPeople == heapSortedPeople)


// MARK: - Algorithms

// test Heap.findNthSmallest
let values = [3, 10, 18, 5, 21, 100]
let findNthSmallestResult = Heap.findNthSmallest(n: 3, in: values)
assert(findNthSmallestResult == 10)


// test is array a heap
let array = [10, 30, 15, 40, 52, 100, 41, 42, 51]
let isArrayAHeapResult = Heap.isMinHeap(array: array)
assert(isArrayAHeapResult == true)
