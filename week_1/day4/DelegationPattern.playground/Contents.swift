import UIKit


/*
 Delegation pattern
 1:1 communication
 */


protocol MyProtocol: AnyObject {
    func printInConsole(_ message: String)
}


class Class1 {
    
    weak var delegate: MyProtocol?
    
    func delegateFunction(_ message: String) {
        delegate?.printInConsole(message)
    }
    
}

class Class2 {
    
    var class1: Class1?
    
    func setClass1(_ class1: Class1?) {
        self.class1 = class1
        self.class1?.delegate = self
    }
    
    func displayName() {
        class1?.delegateFunction("Christian Quicaño")
    }
    
}

extension Class2: MyProtocol {
    
    func printInConsole(_ message: String) {
        let customMessage = "From class2: \(message)"
        print(customMessage)
    }
}


let instance1 = Class1() // 1
let instance2 = Class2() // 1

instance2.setClass1(instance1)
instance1.delegateFunction("New Message")
instance2.displayName()
