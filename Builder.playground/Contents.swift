//: Builder

import UIKit

class Phone {
    var type: String?
    var name: String?
    var price: String?
}

protocol Builder {
    func reset()
    func setType()
    func setName()
    func setPrice()
    func getResult() -> Phone
}

class IPhondeBuilder: Builder {
    var phone = Phone()
    
    func reset() {
        phone = Phone()
    }
    
    func setType() {
        phone.type = "iOS"
    }
    
    func setName() {
        phone.name = "iPhone XS"
    }
    
    func setPrice() {
        phone.price = "$ 899"
    }
    
    func getResult() -> Phone {
        return phone
    }
}

class PixelBuilder: Builder {
    var phone = Phone()

    func reset() {
        phone = Phone()
    }
    
    func setType() {
        phone.type = "Android"
    }
    
    func setName() {
        phone.name = "Google Pixel"
    }
    
    func setPrice() {
        phone.price = "$ 599"
    }
    
    func getResult() -> Phone {
        return phone
    }
}

class Director {
    private var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func setBuilder(builder: Builder) {
        self.builder = builder
    }
    
    func createPhone() -> Phone {
        builder.reset()
        builder.setType()
        builder.setName()
        builder.setPrice()
        return builder.getResult()
    }
}

let iPhoneBuilder = IPhondeBuilder()
let director = Director(builder: iPhoneBuilder)
let iPhone = director.createPhone()
print(iPhone.name!)  // iPhone XS

let pixelBuilder = PixelBuilder()
director.setBuilder(builder: pixelBuilder)
let pixel = director.createPhone()
print(pixel.name!)  // Google Pixel
