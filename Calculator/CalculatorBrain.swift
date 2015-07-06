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
    
    func pushOperand(operand:Double){
        opStack.append(Op.operand(operand))
    }
    
    func performOperation(symble:string){
        
    }
    
}