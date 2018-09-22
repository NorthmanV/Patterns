//: Iterator

import UIKit

final class Destination {
    var name: String
    init(name: String) {
        self.name = name
    }
}

protocol Iterator {
    func next() -> Destination?
}

final class DestinationList {
    var destinations: [Destination]
    
    init(destinations: [Destination]) {
        self.destinations = destinations
    }
}

final class DestinationIterator: Iterator {
    private var current = 0
    private var destinations: [Destination]
    
    init(destinationList: DestinationList) {
        self.destinations = destinationList.destinations
    }
    
    func next() -> Destination? {
        let next = current < destinations.count ? destinations[current] : nil
        current += 1
        return next
    }
}

final class DestinationIteratorReverse: Iterator {
    private var current = 0
    private var destinations: [Destination]
    
    init(destinationList: DestinationList) {
        self.destinations = destinationList.destinations
        self.current = destinations.count - 1
    }
    
    func next() -> Destination? {
        let next = current >= 0 ? destinations[current] : nil
        current -= 1
        return next
    }
}

let list = DestinationList(destinations: [
    Destination(name: "New York"),
    Destination(name: "Paris"),
    Destination(name: "Madrid"),
    ])

let iterator = DestinationIterator(destinationList: list)
while let element = iterator.next() {
    print(element.name)  // New York, Paris, Madrid
}

let iteratorReverse = DestinationIteratorReverse(destinationList: list)
while let element = iteratorReverse.next() {
    print(element.name)  // Madrid, Paris, New York
}
