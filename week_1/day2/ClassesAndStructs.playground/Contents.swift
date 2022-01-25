import UIKit
import SwiftUI

/*
 Classes = reference type
 Structs = value type
 */

// String, Double, Float, [Int], [String: Int], () -> Void, (Int) -> Bool

struct Resolution {
    
    internal let width: Int
    var height: Int
    
    static let storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        1
    }
    
}
var someResolution1 = Resolution(width: 0, height: 0)
print(Resolution.storedTypeProperty)
print(Resolution.computedTypeProperty)

public class VideoMode {
    
    static let storedTypeProperty = "Some value"
    class var computedTypeProperty: Int {
        1
    }
    
    let name: String
    var frameRate: Double
    
    init(name: String, frameRate: Double) {
        self.name = name
        self.frameRate = frameRate
        
    }
    
    public func diffFunc() {
        someFunc()
    }
    
    private func someFunc() {
        
    }
}

let someVideoMode2 = VideoMode(name: "", frameRate: 0.0)
someVideoMode2.diffFunc()

print(VideoMode.storedTypeProperty)

print("classes")
print(someVideoMode2.frameRate)
someVideoMode2.frameRate = 3.0
print(someVideoMode2.frameRate)

let someVideoMode3 = someVideoMode2
someVideoMode3.frameRate = 5.0
print(someVideoMode2.frameRate)

print("structs")
print(someResolution1.height)
someResolution1.height = 4
print(someResolution1.height)
var someResolution2 = someResolution1
someResolution2.height = 6
print(someResolution1.height)
print(someResolution2.height)


let someVideoMode4 = VideoMode(name: "", frameRate: 0.0)
let someVideoMode5 = VideoMode(name: "", frameRate: 0.0)
let someVideoMode6 = someVideoMode4

class VideoModeChild: VideoMode {
}

let child = VideoModeChild(name: "", frameRate: 0.0)

/* Access control
 internal = default
 private = closed
 public / open
 fileprivate

 */


/*
 Classes = reference type
 retain cycle - to prevent it - weak / unowned || strong = default
 ARC = Automatic Reference Counting
 */

class Apartment {
    let number: Int
    weak var tenant: Tenant?
    unowned var tenant2: Tenant = Tenant(name: "")
    init(number: Int) {
        self.number = number
    }
}

class Tenant {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var apt = Apartment(number: 10)

var tenant: Tenant? = Tenant(name: "Christian") // 1 reference
print(tenant?.name)
apt.tenant = tenant // 1 reference
if let temp = tenant {
    apt.tenant2 = temp // 1 reference
}
tenant = nil // removing 1 reference
// 0 reference


/*
 PROTOCOLS = blueprint
 Protocol
 - A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
 - The protocol can then be adopted by a class, structure, or enumeration.
 - You can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.
 */

/*
 TYPES
 POP
 */
protocol BinaryRepresentable {
    mutating func update(data: Data)
    var tag: String { get set }
    var data: Data { get }
}

protocol NewProtocol {
    func update2()
}

extension NewProtocol {
    func update2() {
        print("print something")
    }
    
    var computedProperty: Int {
        return 10
    }
    
    func diffFunc() {
        
    }
}

/*
 Extension
 */

extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

let string = "2"
let number = string.convertToInt()

struct CustomStruct: BinaryRepresentable, NewProtocol {
    
    
    var data: Data
    var tag: String
    
    mutating func update(data: Data) {
        self.data = data
    }
    
}

class CustomClass: BinaryRepresentable {
    
    var data: Data
    var tag: String
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    func update(data: Data) {
        self.data = data
    }
    
}

var array1 = [BinaryRepresentable]()
let b1 = CustomClass(tag: "", data: Data())
let b2 = CustomStruct(data: Data(), tag: "")
b2.diffFunc()

array1.append(b1)
array1.append(b2)

b1.update(data: Data())
//b2.update(data: Data())


enum CustomEnum: CaseIterable {
    case case1
    case case2
}

for eachCase in CustomEnum.allCases {
    
}


/*
 Architecture pattern - mobile apps
 MVC = Model View Controller
 MVP = Model View Presenter
 MVVM = Model View ViewModel
 VIPER = Clean architecture
 */
