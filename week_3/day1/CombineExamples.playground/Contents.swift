import UIKit
import Combine

let intArray = [1, 2, 0, 2, 2, 2, 3, 3, 4, 5, 6, 6, 2, 3, 7, 8, 2, 2]

let publisherIntArray = intArray.publisher
let canceller = publisherIntArray
    .dropFirst(2)
    .removeDuplicates()
    .filter({ output in
        return output < 7
    })
    .map { "\($0)" }
    .sink { value in
        print(value)
    }



// Challenge. This challenge have taken from the web Raywenderlinch.
/*
 Challenge: Filter all the things
 
 Create an example that publishes a collection of numbers from 1 through 100, and use filtering operators to:
 
 1. Skip the first 50 values emitted by the upstream publisher.
 2. Take the next 20 values after those first 50 values.
 3. Only take even number.
 
 The output of your example should produce the following numbers, one per line:
 52 54 56 58 60 62 64 66 68 70
 */

print("challenge")

let numbers = (1...100)
let publisherNumbers = numbers.publisher
publisherNumbers
    .dropFirst(50)
    .prefix(20)
    .filter { $0 % 2 == 0 }
    .sink { print($0) }



/*
 NETWORKING
 */

print("NETWORKING")

let url = "https://jsonplaceholder.typicode.com/posts"

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func getPosts() -> AnyPublisher<[Post], Error> {
    
    guard let url = URL(string: url) else {
        fatalError()
    }
    
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map({ data, response in
            return data
        })
        .decode(type: [Post].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    
}


let publisher = getPosts()
var subscribers = Set<AnyCancellable>()

publisher
    .receive(on: RunLoop.main)
    .sink { _ in } receiveValue: { response in
        print("subscriber 1")
        print(response.count)
    }
.store(in: &subscribers)

publisher.sink { _ in } receiveValue: { response in
    print("subscriber 2")
    print(response.count)
}
.store(in: &subscribers)


//let subscriber = getPosts()
//    .sink(receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("finished")
//        case .failure(let error):
//            print(error.localizedDescription)
//        }
//    },
//          receiveValue: { response in
//        print(response.count)
//    })




