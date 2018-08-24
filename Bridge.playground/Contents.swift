//: Bridge

import UIKit

// Without bridge pattern

class TypeCar {
    var breakPedal: Bool
    var gasPedal: Bool
    var steeringWheel: Bool
    var price: Double
    
    init(breakPedal: Bool, gasPedal: Bool, steeringWheel: Bool, price: Double) {
        self.breakPedal = breakPedal
        self.gasPedal = gasPedal
        self.steeringWheel = steeringWheel
        self.price = price
    }
}

class Truck: TypeCar {}
class Passenger: TypeCar {}
class Bus: TypeCar {}

class BMWTruck: Truck {}
class MercedesTruck: Truck {}
class VolkswagenTruck: Truck {}

class BMWPassenger: Passenger {}
class MercedesPassenger: Passenger {}
class VolkswagenPassenger: Passenger {}

class BMWBus: Bus {}
class MercedesBus: Bus {}
class VolkswagenBus {}

let bmwPass = BMWPassenger(breakPedal: true, gasPedal: true, steeringWheel: true, price: 20_000)

// Totally we have 12 classes and it continue to grow with new types and marks of cars



// With bridge pattern

// Abstraction part

protocol NewTypeCar {
    var breakPedal: Bool {get set}
    var gasPedal: Bool {get set}
    var steeringWheel: Bool {get set}
}

class NewTruck: NewTypeCar {
    var breakPedal: Bool
    var gasPedal: Bool
    var steeringWheel: Bool
    
    init(breakPedal: Bool, gasPedal: Bool, steeringWheel: Bool) {
        self.breakPedal = breakPedal
        self.gasPedal = gasPedal
        self.steeringWheel = steeringWheel
    }
}

class NewPassenger: NewTypeCar {
    var breakPedal: Bool
    var gasPedal: Bool
    var steeringWheel: Bool
    
    init(breakPedal: Bool, gasPedal: Bool, steeringWheel: Bool) {
        self.breakPedal = breakPedal
        self.gasPedal = gasPedal
        self.steeringWheel = steeringWheel
    }
}

class NewBus: NewTypeCar {
    var breakPedal: Bool
    var gasPedal: Bool
    var steeringWheel: Bool
    
    init(breakPedal: Bool, gasPedal: Bool, steeringWheel: Bool) {
        self.breakPedal = breakPedal
        self.gasPedal = gasPedal
        self.steeringWheel = steeringWheel
    }
}

// Implementation part

protocol Price {
    var price: Double {get set}
    var car: NewTypeCar {get set}
}

class BMW: Price {
    var price: Double
    var car: NewTypeCar
    
    init(price: Double, car: NewTypeCar) {
        self.price = price
        self.car = car
    }
}

class Mercedes: Price {
    var price: Double
    var car: NewTypeCar
    
    init(price: Double, car: NewTypeCar) {
        self.price = price
        self.car = car
    }
}

class Volkswagen: Price {
    var price: Double
    var car: NewTypeCar
    
    init(price: Double, car: NewTypeCar) {
        self.price = price
        self.car = car
    }
}

// Now we have only 6 classes and classes quantity will not grow fast

let newBMW = BMW(price: 30_000, car: NewPassenger(breakPedal: true, gasPedal: true, steeringWheel: true))












