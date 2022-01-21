import Foundation

/*
 Control Flow
 */

var scores = [Float]()
scores = [0.6, 0.4, 0.9, 0.9, 0.3]

// 1.
var highs = [Float]()
var average: Float = 0.0

for score in scores {
    if score >= 0.8999 {
        highs.append(score)
    }
    average += score
}

average = average / Float(scores.count)

print(average)
print(highs)


// reset values
highs = []
average = 0
// 2.

let range = 10..<20
print(range)
if range.contains(11) {
    print("true")
}

for values in range.reversed() {
    print(values)
}

for i in (0...5).reversed() {
    print(i)
}


for i in 0..<scores.count {
    let score = scores[i]
    if score >= 0.8999 {
        highs.append(score)
    }
    average += score
}

average = average / Float(scores.count)

print(average)
print(highs)

// 3.
// reset values
highs = []
average = 0

for (index, value) in scores.enumerated() {
    print(index)
    print(value)
}

// 4.
print("4------")
for score in scores where score > 0.8999 {
    print(score)
}




/*
 String
 */

let string = "Hello world"

for character in string {
    print(character)
}


/*
 dictionary
 */

let interestingNumbers: [String: [Int]] = ["Prime": [2, 3, 5, 7, 11, 13], "Fibonacci": [1, 1, 2, 3, 5, 8]]
print("Dictionary")
for (_, value) in interestingNumbers {
    
    print(value)
}


/*
 Switch
 */

let vegetable = ["red", "pepper"]
//let vegetable = "celery"

switch vegetable {
case ["celery"]:
    print("This is a celery")
case ["cucumber", "watercress"]:
    print("custom case")
case let x where x.contains("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("default case")
}


/*
 while
 */

var n = 2
while n < 100 {
    n *= 2
    print(n)
}
