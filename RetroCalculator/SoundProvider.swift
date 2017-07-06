//
//  SoundProvider.swift
//  RetroCalculator
//
//  Created by Tom Dobson on 7/5/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import Foundation
import AVFoundation

protocol soundBytePath {
    var path: String { get set }
}

protocol soundURL {
    var soundURL: URL { get set }
}

class soundByte: soundBytePath, soundURL {
    
    var path: String
    var soundURL: URL
    var sound: AVAudioPlayer!
    
    init?(filePath: String, Ext: String) {
        self.path = Bundle.main.path(forResource: filePath, ofType: Ext)!
        self.soundURL = URL(fileURLWithPath: path)
    }
    
    func prepareSound() {
        
        do {
            try sound = AVAudioPlayer(contentsOf: soundURL)
            sound.prepareToPlay()
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func play() {
        sound.play()
    }
    
    func stop() {
        sound.stop()
    }
    
    func repeatTrack() {
        sound.numberOfLoops = -1
    }
}
