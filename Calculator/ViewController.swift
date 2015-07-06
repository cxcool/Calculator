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
    
    var numberStack = [Double]()
    @IBAction func enter() {
        let displayValueDouble: Double = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
        numberStack.append(displayValueDouble)
        isUserFirstInput = true
        print(displayValueDouble)
    }
    
    func numberOperation(operate:(Double, Double) -> Double){
        if numberStack.count >= 2{
            displayValue.text = operate(numberStack.removeLast(), numberStack.removeLast()).description
        }
        enter()
    }
    func singleNumberOperation(operate:(Double) -> Double){
        if numberStack.count >= 1{
            displayValue.text = operate(numberStack.removeLast()).description
        }
        enter()
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation{
        case "+": numberOperation(){ $0 + $1 }
        case "-": numberOperation() { $1 - $0 }
        case "×": numberOperation() { $0 * $1 }
        case "÷": numberOperation() { $1 / $0 }
        case "√": singleNumberOperation(sqrt)
        default: break
        }
    }
    
}




































