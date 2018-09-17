//: Interpreter

import UIKit

protocol IntegerExpression {
    func evaluate(context: IntegerContext) -> Int
    func replace(character: Character, integerExp: IntegerExpression) -> IntegerExpression
    func copy() -> IntegerExpression
}

class IntegerContext {
    private var data = [Character: Int]()
    func lookUp(name: Character) -> Int {
        return self.data[name]!
    }
    func assign(integerVarExp: IntegerVarExpression, value: Int) {
        self.data[integerVarExp.name] = value
    }
}

class IntegerVarExpression: IntegerExpression {
    let name: Character
    init(name: Character) {
        self.name = name
    }
    
    func evaluate(context: IntegerContext) -> Int {
        return context.lookUp(name: name)
    }
    
    func replace(character: Character, integerExp: IntegerExpression) -> IntegerExpression {
        if character == name {
            return integerExp.copy()
        } else {
            return IntegerVarExpression(name: character)
        }
    }
    
    func copy() -> IntegerExpression {
        return IntegerVarExpression(name: name)
    }
}

class AddExpression: IntegerExpression {
    private var op1: IntegerExpression
    private var op2: IntegerExpression

    init(op1: IntegerExpression, op2: IntegerExpression) {
        self.op1 = op1
        self.op2 = op2
    }
    
    func evaluate(context: IntegerContext) -> Int {
        return self.op1.evaluate(context: context) + self.op2.evaluate(context: context)
    }
    
    func replace(character: Character, integerExp: IntegerExpression) -> IntegerExpression {
        return AddExpression(op1: op1.replace(character: character, integerExp: integerExp), op2: op2.replace(character: character, integerExp: integerExp))
    }
    
    func copy() -> IntegerExpression {
        return AddExpression(op1: op1, op2: op2)
    }
}

var a = IntegerVarExpression(name: "a")
var b = IntegerVarExpression(name: "b")
var c = IntegerVarExpression(name: "c")

var expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c))
var integerContext = IntegerContext()

integerContext.assign(integerVarExp: a, value: 2)
integerContext.assign(integerVarExp: b, value: 4)
integerContext.assign(integerVarExp: c, value: 6)

var result = expression.evaluate(context: integerContext)  // 12















