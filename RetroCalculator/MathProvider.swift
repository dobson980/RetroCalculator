//
//  MathProvider.swift
//  RetroCalculator
//
//  Created by Tom Dobson on 7/6/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import Foundation

enum Operation: String {
    case Divide = "/"
    case Multiply = "*"
    case Add = "+"
    case Subtract = "-"
    case Empty = "Empty"
    
}

class Calculator {
    
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    func processOperation(ofOperator: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                switch currentOperation {
                case Operation.Multiply: result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                case Operation.Add: result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                case Operation.Divide: result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                case Operation.Subtract: result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                case Operation.Empty: result = "Empty"
                }
                
                leftValStr = result
                
            }
            
            currentOperation = ofOperator
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = ofOperator
        }
    
    }
    
    func clear() {
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
    }

}
