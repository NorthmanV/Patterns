//: Facade

import UIKit

// Pizzeria example

class DiscountDepartment {
    func getDiscount(count: Int) -> Double {
        switch count {
        case 1: return 0
        case 2...5: return 10
        default: return 20
        }
    }
}

class OrderDepartment {
    func getPrice(count: Int) -> Double {
        return Double(count * 500)
    }
}

class DeliveryDepartment {
    func getDeliveryTime(address: String) -> Int {
        if address == "Nevsky district" {
            return 40
        } else {
            return 90
        }
    }
}

class PizzaService {
    let discount: DiscountDepartment
    let order: OrderDepartment
    let delivery: DeliveryDepartment
    
    init(discount: DiscountDepartment, order: OrderDepartment, delivery: DeliveryDepartment) {
        self.discount = discount
        self.order = order
        self.delivery = delivery
    }
    
    func getInfo(count: Int, address: String) -> (Double, Int) {
        let regularPrice = order.getPrice(count: count)
        let discountPrice = discount.getDiscount(count: count)
        let fullPrice = regularPrice - regularPrice * discountPrice / 100
        let deliveryTime = delivery.getDeliveryTime(address: address)
        return (fullPrice, deliveryTime)
    }
}

let callCenter = PizzaService(discount: DiscountDepartment(), order: OrderDepartment(), delivery: DeliveryDepartment())

let client1 = callCenter.getInfo(count: 5, address: "Nevsky district")  // (2250.0, 40)
let client2 = callCenter.getInfo(count: 8, address: "Centralny district") // (3200.0, 90)










