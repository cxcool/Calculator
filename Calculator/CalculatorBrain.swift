//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 菜 on 15/7/6.
//  Copyright © 2015年 菜. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    enum Op{
        case operand(Double)
        case operation(String, (Double, Double) -> Double)
        case singleOperation(String , Double -> Double)
    }
    
    var opStack = [Op]()
    
    var knownOps = [String: Op]()
    
    init(){
        knownOps["+"] = Op.operation("+"){ $0 + $1 }
        knownOps["-"] = Op.operation("-"){ $1 - $0 }
        knownOps["×"] = Op.operation("×"){ $0 * $1 }
        knownOps["÷"] = Op.operation("÷"){ $1 / $0 }
        knownOps["√"] = Op.singleOperation("√"){ sqrt($0) }
    }
    
    func evaluate(ops: [Op]) ->(result: Double?, remaining: [Op]){
        if !ops.isEmpty {
            var remainStack = ops
            let op = remainStack.removeLast()
            switch op{
            case .operand(let operand):
                return (operand, remainStack)
            case .singleOperation(_, let operation):
                let operandEvaluation = evaluate(remainStack)
                if let operand = operandEvaluation.result{
                    return (operation(operand), operandEvaluation.remaining)
                }
            case .operation(_, let operation):
                let op1Evaluate = evaluate(remainStack)
                if let operand1 = op1Evaluate.result{
                    let op2Evaluate = evaluate(op1Evaluate.remaining)
                    if let operand2 = op2Evaluate.result{
                        return (operation(operand1, operand2), op2Evaluate.remaining)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double?{
        let (result, remainder) = evaluate(opStack)
        return result
    }
    
    func pushOperand(operand:Double) -> Double? {
        opStack.append(Op.operand(operand))
        return evaluate()
    }
    
    func performOperation(symble:String) -> Double? {
        if let operation = knownOps[symble]{
            opStack.append(operation)
        }
        return evaluate()
    }
    
}