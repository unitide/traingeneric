import UIKit

let stringArrayE = ["100", "20", "35", "ABCD", "BXZY", "59"]
let intArrayE = [1, 2, 3, 4, 5, 6]

// map operator
let intArray1 = stringArrayE.map({ element -> Int? in
    let intValue = Int(element)
    return intValue
})
print(intArray1)

let intArray2 = stringArrayE.map { element -> Int? in
    let intValue = Int(element)
    return intValue
}
print(intArray2)

let stringArray3 = stringArrayE.map { $0 }
print(stringArray3)


// Compact map
let intArray4 = stringArrayE.compactMap { Int($0) }
print(intArray4)


// Sort


struct Book {
    let identifier: Int
}
let books = [Book(identifier: 0), Book(identifier: 1), Book(identifier: 2), Book(identifier: 3), Book(identifier: 4), Book(identifier: 5)]

let arrayOfArray = [[1, 2, 3], [2, 4], [5]]
//let newArray = arrayOfArray.map { $0[2] }
//print(newArray)

// Sort
//true / false
var arrayOfArraySorted = arrayOfArray.sorted(by: { array1, array2 in
    let total1 = array1.count
    let total2 = array2.count
    return total1 < total2
})
print(arrayOfArraySorted)

arrayOfArraySorted = arrayOfArray.sorted(by: { $0.count > $1.count })
print(arrayOfArraySorted)


// filter
let arrayFiltered = arrayOfArray.filter { $0.contains(2) }
print(arrayFiltered)

// reduce
var newArray1 = arrayOfArray.reduce([Int](), { initialValue, nextValue -> [Int] in
    var initialValue = initialValue
    initialValue += nextValue
    return initialValue
})
print(newArray1)

var total = arrayOfArray.reduce(0, { initialValue, nextValue -> Int in
    var initialValue = initialValue
    initialValue += nextValue.count
    return initialValue
})
print(total)


//total = intArrayE.reduce(0, +)
//print(total)

