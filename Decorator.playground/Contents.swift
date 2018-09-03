//: Decorator

import UIKit

protocol IceCream {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleIceCream: IceCream {
    func getCost() -> Double {
        return 10
    }
    
    func getIngredients() -> String {
        return "Ice cream"
    }
}

class IceCreamDecorator: IceCream {
    private let decoratedIceCream: IceCream
    fileprivate let ingredientSeparator = ", "
    
    required init(decoratedIceCream: IceCream) {
        self.decoratedIceCream = decoratedIceCream
    }
    
    func getCost() -> Double {
        return decoratedIceCream.getCost()
    }
    
    func getIngredients() -> String {
        return decoratedIceCream.getIngredients()
    }
 }

class Bananas: IceCreamDecorator {
    required init (decoratedIceCream: IceCream) {
        super.init(decoratedIceCream: decoratedIceCream)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 3.5
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Bananas"
    }
}

class Chocolate: IceCreamDecorator {
    required init (decoratedIceCream: IceCream) {
        super.init(decoratedIceCream: decoratedIceCream)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 5
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Chocolate"
    }
}

var iceCream: IceCream = SimpleIceCream()
iceCream.getCost()  // 10

iceCream = Chocolate(decoratedIceCream: iceCream)
iceCream.getCost()  // 15

iceCream = Bananas(decoratedIceCream: iceCream)
iceCream.getCost()  // 18.5
iceCream.getIngredients()  // Ice cream, Chocolate, Bananas
















