import Foundation


var name: String = "Christian"
name = "Anthony"

func myFunction() {
    
}


/*
 Closure
 */


var closure: () -> Void = {
    print("My closure")
}
closure()

closure = {
    print("New value")
}
closure()


typealias Closure = (Int) -> Void

func fetchFromAPI(from url: String, completion: (Int, Int, Double) -> Void) {
    // fetch
    // get the json
    // mapping to the model
    let numberFromAPI = 200
    completion(numberFromAPI, numberFromAPI, 0.0)
}

fetchFromAPI(from: "https://url.com", completion: { code1, code2, code3 in
    print(code1)
    print(code2)
    print(code3)
})

fetchFromAPI(from: "https://url.com") { code1, code2, code3 in
    print(code1)
    print(code2)
    print(code3)
}


/*
 Higer order function
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let nameSorted1 = names.sorted(by: { name1, name2 in
    return name1 < name2
})
print(nameSorted1)

let nameSorted2 = names.sorted { name1, name2 in
    return name1 < name2
}
print(nameSorted2)

let nameSorted3 = names.sorted { $0 < $1 }
print(nameSorted3)

/*
 Enumerations
 */

enum CompassPoint {
    case north
    case south
    case east
    case west
}

print(CompassPoint.east)

enum Planet: Int, CaseIterable {
    case mercury = 1
    case venus = 4
    case earth = 6
    case mars = 9
}

print(Planet.mercury.rawValue)
print(Planet.earth.rawValue)

let value = 6
let earthCase = Planet(rawValue: value)
print(earthCase)

enum Names: String {
    case chris = "Christian"
    case anth = "Anthony"
}

for planetCase in Planet.allCases {
    print(planetCase.rawValue)
}


enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
    
    var computedProperty: String {
        switch self {
        case .bored:
            return "bored"
        case .running:
            return "running"
        case .talking:
            return "talking"
        case .singing:
            return "singing"
        }
    }
    
}

let talking = Activity.talking(topic: "football")
print(talking.computedProperty)

switch talking {
case .bored:
    print("bored")
case .running:
    print("running")
case .talking(let anyName):
    print("talking about: \(anyName)")
case .singing:
    print("singing")
}
