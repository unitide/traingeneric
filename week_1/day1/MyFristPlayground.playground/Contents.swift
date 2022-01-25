import Foundation

let name: String = "Christian Quicaño"
var myAge = 36
myAge += 1

print(name)
print(myAge)

var optionalVariable: String? = "start with value"
print(optionalVariable)
optionalVariable = "My value"
print(optionalVariable)
optionalVariable = "new value 2"
print(optionalVariable!)

optionalVariable = nil
print(optionalVariable)


let completeInformation1 = name + " " + "\(myAge)"
print(completeInformation1)

let completeInformation2 = "My name is: \(name)"
let completeInformation3 = "My age is: \(myAge + 1)"
print(completeInformation2)
print(completeInformation3)
print("My age is: \(myAge)")


let currentYear = "2022"
// optional binding
if let currentYearInt = Int(currentYear) {
    print(currentYearInt)
} else {
    print("it is a nil")
}

/*
 FUNCTIONS
 */

func printFullName() {
    print("Christian Anthony Quicaño Zavaleta")
}

printFullName()

func generateGreeting(anyName age: Int, name: String = "Christian Quicaño") -> String {
    let newAge = age + 1
    let customGreeting = "My Age is \(newAge) and my name is \(name)"
    return customGreeting
}

let greeting = generateGreeting(anyName: 36, name: "Anthony")
print(greeting)

let greeting2 = generateGreeting(anyName: 36)
print(greeting2)


var age2: String? = nil
age2 = "start with some string"

func optionalChaining(age: String?) -> String? {
    var newVariable = age
    newVariable?.append(" another string")
    return newVariable
}

if let newString = optionalChaining(age: age2) {
    print(newString)
}


/*
 COLLECTION TYPES
 - ARRAY
 - DICTIONARY
 - SETS
 */

var ages: [Int] = [36, 20, 22, 40, 45, 36, 40, 50, 50]
print(ages[2])
ages.remove(at: 2)
print(ages[2])

var ages2 = [Int]() // creating an empty array
print(ages2)

var ages3: [Int] = [] // creating an empty array
print(ages3)

var ages4 = Array<Int>() // creating an empty array
print(ages4)

var ages5: Array<Int> = [] // creating an empty array
print(ages5)


// Dictionary
var dictionary = ["name": "Christian", "lastname": "Quicaño"]
print(dictionary["lastname"])

var dictionary2: [Int: [Int: String]] = [:]
//dictionary2[200] = "success"
//dictionary2[404] = "not found"

//print(dictionary2[404])

var dictionary3 = Dictionary<String, String>()
var dictionary4 =  [String: String]()

let setAges = Set(ages)
print(setAges)
