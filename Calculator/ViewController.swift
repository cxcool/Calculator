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
    var brain = CalculatorBrain()
    
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
//        numberStack.append(displayValueDouble)
//        print(displayValueDouble)
        isUserFirstInput = true
        if let result = brain.pushOperand(displayValueDouble){
            displayValue.text = result.description
        }else{
            displayValue.text = 0.description
        }
        
    }
    
//    func numberOperation(operate:(Double, Double) -> Double){
//        if numberStack.count >= 2{
//            displayValue.text = operate(numberStack.removeLast(), numberStack.removeLast()).description
//        }
//        enter()
//    }
//    func singleNumberOperation(operate:(Double) -> Double){
//        if numberStack.count >= 1{
//            displayValue.text = operate(numberStack.removeLast()).description
//        }
//        enter()
//    }
    @IBAction func operate(sender: UIButton) {
        
        if !isUserFirstInput {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue.text = "\(result)"
            }else{
                displayValue.text = "0"
            }
        }
    }
    
}




































