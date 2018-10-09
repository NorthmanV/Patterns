//: Singleton

import UIKit

final class Singleton {
    static let shared = Singleton()
    
    private init() {}
    
    var value = 0
    
    func doSomething() {
        print("Doing something with \(value)")
    }
}

var object = Singleton.shared
object.value = 1000

var secondObject = Singleton.shared
secondObject.value = 2000

object.doSomething()  // Doing something with 2000
secondObject.doSomething()  // Doing something with 2000

print(object === secondObject) // true
