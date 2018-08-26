//: Composite

import UIKit

protocol Unit {
    func getStrength() -> Int
}

class Archer: Unit {
    func getStrength() -> Int {
        return 3
    }
}

class Infantryman: Unit {
    func getStrength() -> Int {
        return 2
    }
}

class InfantrymanStrong: Unit {
    func getStrength() -> Int {
        return 3
    }
}

class InfantrymanWeak: Unit {
    func getStrength() -> Int {
        return 1
    }
}

class Horseman: Unit {
    func getStrength() -> Int {
        return 5
    }
}

// Composite

class Army: Unit {
    var units = [Unit]()
    init(units: [Unit]) {
        self.units = units
    }
    
    func getStrength() -> Int {
        var totalStrength = 0
        for unit in units {
            totalStrength += unit.getStrength()
        }
        return totalStrength
    }
}

let myHorsemen: [Unit] = Array(repeating: Horseman(), count: 300)
let myArchers: [Unit] = Array(repeating: Archer(), count: 500)
let myArmy = Army(units: myHorsemen + myArchers)
myArmy.getStrength()  // 3000

let enemyInfantrymenStrong: [Unit] = Array(repeating: InfantrymanStrong(), count: 500)
let enemyArchers: [Unit] = Array(repeating: Archer(), count: 800)
let enemyArmy = Army(units: enemyInfantrymenStrong + enemyArchers)
enemyArmy.getStrength()  // 3900

myArmy.getStrength() > enemyArmy.getStrength() ? print("Victory") : print("Lose")  // Lose














