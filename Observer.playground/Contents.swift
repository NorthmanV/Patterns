//: Observer

import UIKit

protocol Observable {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notifyObservers()
}

protocol Observer {
    var id: String { get set }
    func update(value: Int?)
}

final class NewsResource: Observable {
    private var observers = [Observer]()
    
    var value: Int? {
        didSet {
            notifyObservers()
        }
    }
    
    func add(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        guard let index = observers.enumerated().first(where: {$0.element.id == observer.id})?.offset else { return }
        observers.remove(at: index)
    }
    
    func notifyObservers() {
        observers.forEach({$0.update(value: value)})
    }
}

final class NewsAgency: Observer {
    var id = "News Agency"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("News Agency handle \(value)")
    }
}

final class Reporter: Observer {
    var id = "Reporter"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("Reporter handle \(value)")
    }
}

final class Blogger: Observer {
    var id = "Blogger"
    
    func update(value: Int?) {
        guard let value = value else { return }
        print("Blogger handle \(value)")
    }
}

let resource = NewsResource()
let newsAgency = NewsAgency()
let reporter = Reporter()
let blogger = Blogger()

resource.add(observer: newsAgency)
resource.add(observer: reporter)
resource.value = 5
//News Agency handle 5
//Reporter handle 5

resource.add(observer: blogger)
resource.value = 7
//News Agency handle 7
//Reporter handle 7
//Blogger handle 7

resource.remove(observer: reporter)
resource.value = 10
//News Agency handle 10
//Blogger handle 10
