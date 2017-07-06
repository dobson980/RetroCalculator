//
//  SplashViewController.swift
//  RetroCalculator
//
//  Created by Tom Dobson on 7/5/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit
import AVFoundation

class SplashViewController: UIViewController {
    
    let ambSound = soundByte(filePath: "test4", Ext: "m4a")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ambSound?.prepareSound()
        ambSound?.repeatTrack()
        ambSound?.play()
        
    }
    @IBAction func stopMusicOnSeque(_ sender: Any) {
        ambSound?.stop()
    }
    
}
