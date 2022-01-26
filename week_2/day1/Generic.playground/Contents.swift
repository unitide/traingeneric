import UIKit

let arrInt = Array<Int>()
let arrString = Array<String>()


// Stack is a collection type with values ordered like an array but the difference is that the Stack only we can remove the last object added. Last In First Out (LIFO)


struct IntStack {
    private var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    func displayInConsole() {
        for element in items {
            print(element)
        }
    }
}

struct StringStack {
    private var items = [String]()
    mutating func push(_ item: String) {
        items.append(item)
    }
    mutating func pop() -> String {
        return items.removeLast()
    }
    func displayInConsole() {
        for element in items {
            print(element)
        }
    }
}

enum CustomError: Error {
    case badURL
    case badParData
}

let result = Result<[String], CustomError>.success([""])
switch result {
case .success(let success):
    print(success)
case .failure(let failure):
    print(failure.localizedDescription)
}

struct Stack<Element> {
    private var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    func displayInConsole() {
        for element in items {
            print(element)
        }
    }
}

//protocol Stack {
//    associatedtype Element
//    var items: [Element] { get set }
//    mutating func push(_ item: Element)
//    mutating func pop() -> Element
//}
//
//extension Stack {
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//
//struct CustomStruct<Element>: Stack {
//    var items: [Element] = []
//}

/*
 POP
 */

var intStack2 = Stack<Int>()
intStack2.push(5)

var stringStack2 = Stack<String>()
stringStack2.push("")

var arrayStack = Stack<[String]>()
arrayStack.push([""])


var intStack = IntStack()
intStack.push(2)
intStack.push(4)
intStack.displayInConsole()
intStack.pop()
print("--")
intStack.displayInConsole()

print("----")
var stringStack = StringStack()
stringStack.push("Christian")
stringStack.push("Jose")
stringStack.displayInConsole()
stringStack.pop()
print("--")
stringStack.displayInConsole()
