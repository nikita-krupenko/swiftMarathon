//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    let time = ["Soft": 320,"Medium": 420 ,"Hard": 720]
    var remainingTime: Int = 60
    @IBOutlet weak var titleLabel: UILabel!
    var totalTIme = 0
    var seccondPassed = 0
    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func selected(_ sender: UIButton) {
        let results = sender.currentTitle ?? "Ошибка"
        seccondPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = results
        timer.invalidate()
        
        totalTIme =  time[results] ?? 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        if let sel = time[results]{
            print(sel)
            buttonPressed(sender)
        }
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
          @objc  func updateTime(){
                if seccondPassed < totalTIme {
                    seccondPassed+=1
                    progressBar.progress = Float(seccondPassed) / Float(totalTIme)
                 
                }else {
                    timer.invalidate()
                    titleLabel.text = "Готово"
                    playSound()
                }
            }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
        
    }

