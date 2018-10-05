//: Abstract factory

import UIKit

protocol Button {
    var size: CGRect? { get set }
    func pushButton()
}

class IPhoneButton: Button {
    var size: CGRect?
    
    func pushButton() {
        print("iPhone button pushed")
    }
}

class IPadButton: Button {
    var size: CGRect?
    
    func pushButton() {
        print("iPad button pushed")
    }
}


protocol TextView {
    var size: CGRect? { get set }
    func didEnterText()
}

class IPhoneTextView: TextView {
    var size: CGRect?
    
    func didEnterText() {
        print("Text entered on iPhone")
    }
}

class IPadTextView: TextView {
    var size: CGRect?
    
    func didEnterText() {
        print("Text entered on iPad")
    }
}

protocol AbstractFactory {
    func createButton() -> Button
    func createTextView() -> TextView
}

class IPhoneFactory: AbstractFactory {
    func createButton() -> Button {
        return IPhoneButton()
    }
    
    func createTextView() -> TextView {
        return IPhoneTextView()
    }
}

class IPadFactory: AbstractFactory {
    func createButton() -> Button {
        return IPadButton()
    }
    
    func createTextView() -> TextView {
        return IPadTextView()
    }
}

let factory1 = IPhoneFactory()
let button1 = factory1.createButton()
button1.pushButton()  //iPhone button pushed
let textView1 = factory1.createTextView()
textView1.didEnterText()  //Text entered on iPhone

let factory2 = IPadFactory()
let button2 = factory2.createButton()
button2.pushButton()  //iPad button pushed
let textView2 = factory2.createTextView()
textView2.didEnterText()  //Text entered on iPad
