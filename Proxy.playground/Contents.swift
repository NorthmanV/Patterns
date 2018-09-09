//: Proxy

import UIKit

protocol Human {
    func move() -> String
    func getName() -> String
}

class Ronaldo: Human {
    func move() -> String {
        return "Run"
    }
    
    func getName() -> String {
        return "Cristiano Ronaldo"
    }
}

class Surrogate: Human {
    let owner: Human
    
    init(owner: Human) {
        self.owner = owner
    }
    
    func move() -> String {
        return owner.move()
    }
    
    func getName() -> String {
        return owner.getName()
    }
}

let ronaldo = Ronaldo()
let ronaldoSurrogate = Surrogate(owner: ronaldo)

ronaldoSurrogate.move()  // Run
ronaldoSurrogate.getName()  // Cristiano Ronaldo










