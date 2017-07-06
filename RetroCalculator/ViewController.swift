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
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
        
    }
    
    var currentOperation = Operation.Empty
    
    var leftValStr = ""
    var rightValStr = ""
    var result = ""

    @IBOutlet weak var outputLbl: UILabel!
    @IBAction func onDivide(_ sender: Any) {
        processOperation(ofOperator: Operation.Divide)
    }
    @IBAction func onMultiply(_ sender: Any) {
        processOperation(ofOperator: Operation.Multiply)
    }
    @IBAction func onSubtract(_ sender: Any) {
        processOperation(ofOperator: Operation.Subtract)
    }
    @IBAction func onAdd(_ sender: Any) {
        processOperation(ofOperator: Operation.Add)
    }
    @IBAction func onEquals(_ sender: Any) {
        processOperation(ofOperator: currentOperation)
    }
    @IBAction func clear(_ sender: Any) {
        clear()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        outputLbl.text = "0"
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(ofOperator: Operation) {
        playSound()
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
                outputLbl.text = result
            }
            
            currentOperation = ofOperator
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = ofOperator
        }
        
    }
    
    func clear() {
        outputLbl.text = "0"
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
    }
    
        

}


