//: Prototype

import UIKit

final class WebManager {
    func getData(with url: URL) -> Data {
        return Data()
    }
}

final class ComplicatedObject {
    private var configuration: Data
    
    init(url: URL) {
        let webManager = WebManager()
        configuration = webManager.getData(with: url)
    }
    
    init(object: ComplicatedObject) {
        configuration = object.configuration
    }
    
    func clone() -> ComplicatedObject {
        return ComplicatedObject(object: self)
    }
}

let object = ComplicatedObject(url: URL(string: "www")!)
let clone = object.clone()
print(object === clone)  // false

let anotherObject = object
print(object === anotherObject)  // true
