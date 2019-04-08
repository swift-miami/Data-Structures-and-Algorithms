func mergeSort<T: Comparable>(array: inout [T]) -> [T] {
    guard array.count > 1 else { return array }

    let middle = array.count / 2
    var left = Array(array[..<middle])
    var right = Array(array[middle...])

    left = mergeSort(array: &left)
    right = mergeSort(array: &right)

    func merge(left: [T], right: [T]) -> [T] {
        var result: [T] = []

        var lIndex = 0
        var rIndex = 0

        while lIndex < left.count || rIndex < right.count {

            if rIndex >= right.count {
                result.append(left[lIndex])
                lIndex += 1
            }
            else if lIndex >= left.count {
                result.append(right[rIndex])
                rIndex += 1
            }
            else {
                let lValue = left[lIndex]
                let rValue = right[rIndex]
                if lValue < rValue {
                    result.append(lValue)
                    lIndex += 1
                }
                else {
                    result.append(rValue)
                    rIndex += 1
                }
            }

        }
        return result
    }

    return merge(left: left, right: right)
}
