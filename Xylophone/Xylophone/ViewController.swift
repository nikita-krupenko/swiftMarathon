//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedD(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedE(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedF(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedG(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedA(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    @IBAction func keyPressedB(_ sender: UIButton) {
        playSound(nameSound: sender.currentTitle!)
        buttonPressed(sender)
    }
    
    func playSound(nameSound: String) {
        let url = Bundle.main.url(forResource: nameSound, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    func buttonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 1.0
            }
        }
    }
}

