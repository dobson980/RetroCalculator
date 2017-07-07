//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Tom Dobson on 7/2/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let btnSound = soundByte(filePath: "btn", Ext: "wav")
    let calc = Calculator()
    
    @IBOutlet weak var outputLbl: UILabel!
    
    @IBAction func onDivide(_ sender: Any) {
        calc.processOperation(ofOperator: Operation.Divide)
        btnSound?.play()
    }
    @IBAction func onMultiply(_ sender: Any) {
        calc.processOperation(ofOperator: Operation.Multiply)
        btnSound?.play()
    }
    @IBAction func onSubtract(_ sender: Any) {
        calc.processOperation(ofOperator: Operation.Subtract)
        btnSound?.play()
    }
    @IBAction func onAdd(_ sender: Any) {
        calc.processOperation(ofOperator: Operation.Add)
        btnSound?.play()
    }
    @IBAction func onEquals(_ sender: Any) {
        calc.processOperation(ofOperator: calc.currentOperation)
        outputLbl.text = calc.result
        btnSound?.play()
    }
    @IBAction func clear(_ sender: Any) {
        calc.clear()
        outputLbl.text = "0"
        btnSound?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = "0"
        btnSound?.prepareSound()
        
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        btnSound?.play()
        
        calc.runningNumber += "\(sender.tag)"
        outputLbl.text = calc.runningNumber
    }
    
    
        
}





