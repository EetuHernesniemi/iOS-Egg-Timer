//
//  ViewController.swift
//  Egg Timer
//
//  Created by Eetu Hernesniemi on 21.9.2021.
//

import UIKit

class ViewController: UIViewController {
    let eggBoilTimeInMinutes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var timerSeconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness : String = sender.currentTitle!//Make sure egg buttons have correct title values.
        timerSeconds = eggBoilTimeInMinutes[hardness]! * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.updateTimerCounting()
        }
    }
    
    func updateTimerCounting(){
        print(timerSeconds)
        if(timerSeconds > 1){
            timerSeconds -= 1
        } else if timerSeconds == 1{
            timerSeconds -= 1
            alarm()
        }else{
            timer.invalidate()
        }
    }
    
    func alarm(){
        //TODO: alarm noice implementation
        print("Aleeeert! Egs are done.")
    }
}

