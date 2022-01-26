import UIKit


let range = 0..<1000

//let label = UILabel()

var counter = 0 // value type

// Grand Central Dispatcher
// OperationQueue

DispatchQueue.global().async {
    for i in range {
//        print("new thread: \(i)")
        counter += i
    }
    
    print(counter)
    
//    // update UI
//    DispatchQueue.main.async {
//        label.text = "\(counter)"
//    }
}

Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
    print(counter)
}

print(counter)

//for i in range {
//    print("main thread \(i)")
//}
//label.text = "100"
