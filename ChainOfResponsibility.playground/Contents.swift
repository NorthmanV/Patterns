//: Chain of responsibility

import UIKit

class MoneyPacket {
    let value: Int
    var quantity: Int
    var nextPacket: MoneyPacket?
    
    init(value: Int, quantity: Int, nextPacket: MoneyPacket?) {
        self.value = value
        self.quantity = quantity
        self.nextPacket = nextPacket
    }
    
    func canWithdraw(v: inout Int) -> Bool {
        func canTakeBill(want: Int) -> Bool {
            return (want / value) > 0
        }
        
        var q = quantity
        while canTakeBill(want: v) {
            if q == 0 {
                break
            }
            v -= value
            q -= 1
        }
        if v == 0 {
            return true
        } else if let next = nextPacket {
            return next.canWithdraw(v: &v)
        }
        return false
    }
}

class ATM {
    private var hundred: MoneyPacket
    private var fifty: MoneyPacket
    private var twenty: MoneyPacket
    private var ten: MoneyPacket
    
    init(hundred: MoneyPacket, fifty: MoneyPacket, twenty: MoneyPacket, ten: MoneyPacket) {
        self.hundred = hundred
        self.fifty = fifty
        self.twenty = twenty
        self.ten = ten
    }
    
    func canWithdraw(value: inout Int) -> String {
        return "Can withdraw: \(hundred.canWithdraw(v: &value))"
    }
}

let ten = MoneyPacket(value: 10, quantity: 100, nextPacket: nil)
let twenty = MoneyPacket(value: 20, quantity: 100, nextPacket: ten)
let fifty = MoneyPacket(value: 50, quantity: 100, nextPacket: twenty)
let hundred = MoneyPacket(value: 100, quantity: 100, nextPacket: fifty)

let atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)

var v1 = 20000
atm.canWithdraw(value: &v1)  // Can withdraw: false

var v2 = 15000
atm.canWithdraw(value: &v2)  // Can withdraw: true























