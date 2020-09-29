//
//  ViewController.swift
//  Menu Bars
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    var timer: Timer?
    
    var time = 210
    
    
    @IBOutlet weak var timeLabel: UILabel!

    @objc func startTimer() {
        
        if time > 0 {
            time -= 1
            timeLabel.text = String(time)
        }
        else {
          resetTimer()
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        time = 210
        timeLabel.text = String(time)
    }
    
    @IBAction func playTimer(_ sender: UIBarButtonItem) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseTimer(_ sender: UIBarButtonItem) {
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        resetTimer()
    }
    
    @IBAction func updateTime(_ sender: Any) {
        if timer != nil{
            if (sender as! UIBarButtonItem).tag == 0{
                time -= 10
            }
            else {
                time += 10
            }
        }
    }
    
    

    
}

