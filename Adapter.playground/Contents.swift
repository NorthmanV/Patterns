//: Adapter

import UIKit

protocol Celcius {
    var celcius: Double {get}
}

class CelciusThermometer: Celcius {
    var celcius: Double
    init(celcius: Double) {
        self.celcius = celcius
    }
}

class Temperature {
    var thermometer: Celcius
    func weather() -> String {
        switch thermometer.celcius {
        case -100 ..< -5: return "\(thermometer.celcius) - Cold"
        case -5 ..< 5: return "\(thermometer.celcius) - Normal"
        case 5 ..< 20: return "\(thermometer.celcius) - Warm"
        default: return "\(thermometer.celcius) - Hot"
        }
    }
    init(thermometer: Celcius) {
        self.thermometer = thermometer
    }
}

class FahrenheitThermometer {
    var farenheit: Double
    init(farenheit: Double) {
        self.farenheit = farenheit
    }
}

class Adapter: Celcius {
    var celcius: Double {
        return (target.farenheit - 32) / 1.8
    }
    private var target: FahrenheitThermometer
    init(target: FahrenheitThermometer) {
        self.target = target
    }
}

let celcuisThermometer = CelciusThermometer(celcius: -15)
let temp1 = Temperature(thermometer: celcuisThermometer)
print(temp1.weather()) // -15.0 - Cold

let fahrenheitThermometer = FahrenheitThermometer(farenheit: 50)
let temp2 = Temperature(thermometer: Adapter(target: fahrenheitThermometer))
print(temp2.weather()) // 10.0 - Warm







