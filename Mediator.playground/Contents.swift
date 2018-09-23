//: Mediator

import UIKit

// Tesla autopilot

class Sensor {
    let mediator: Mediator
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, sensor: self)
    }
    
    func receive(message: String, sensor: Sensor) {}
}

protocol Mediator {
    func send(message: String, sensor: Sensor)
}

class Computer: Mediator {
    private var sensors = [Sensor]()

    func add(sensor: Sensor) {
        sensors.append(sensor)
    }
    
    func send(message: String, sensor: Sensor) {
        for element in sensors {
            if element !== sensor {  // classes comparison
                sensor.receive(message: message, sensor: element)
            }
        }
    }
}

class ConcreteSensor: Sensor {
    let name: String
    
    init(name: String, mediator: Mediator) {
        self.name = name
        super.init(mediator: mediator)
    }
    
    override func receive(message: String, sensor: Sensor) {
        guard let sensor = sensor as? ConcreteSensor else { return }
        print("Sensor \(sensor.name) received: \(message)")
    }
}

let computer = Computer()

let camera = ConcreteSensor(name: "Camera", mediator: computer)
let radar = ConcreteSensor(name: "Radar", mediator: computer)
let gps = ConcreteSensor(name: "GPS", mediator: computer)

computer.add(sensor: camera)
computer.add(sensor: radar)
computer.add(sensor: gps)

gps.send(message: "Lat: 21.312, Lon: 47.324")

//Sensor Camera received: Lat: 21.312, Lon: 47.324
//Sensor Radar received: Lat: 21.312, Lon: 47.324

