//
//  ViewController.swift
//  Calculator
//
//  Created by 菜 on 15/7/6.
//  Copyright © 2015年 菜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayValue: UILabel!
    
    var isUserFirstInput = true
    @IBAction func digit(sender: UIButton) {
        let digit = sender.currentTitle!
        if isUserFirstInput{
            displayValue.text = digit
            isUserFirstInput = false
        }else{
            displayValue.text = displayValue.text! + digit
        }
    }
    var numberStack = Array<Double>()
    
    @IBAction func enter() {
        let displayValueDouble: Double = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
        numberStack.append(displayValueDouble)
        isUserFirstInput = true
        print(displayValueDouble)
    }
    
    func mutiply(op1: Double, op2: Double) -> Double{
        return op1*op2
    }
    func add(op1: Double, op2: Double) -> Double{
        return op1+op2
    }
    func divide(op1: Double, op2: Double) -> Double{
        return op2/op1
    }
    func subtraction(op1: Double, op2: Double) -> Double{
        return op2-op1
    }
    func numberOperation(operate:(Double, Double) -> Double){
        if numberStack.count >= 2{
            displayValue.text = operate(numberStack.removeLast(), numberStack.removeLast()).description
        }
        enter()
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation{
            case "+": numberOperation(add)
            case "-": numberOperation(subtraction)
            case "×": numberOperation(mutiply)
            case "÷": numberOperation(divide)
        default: break
        }
    }
    
}




































