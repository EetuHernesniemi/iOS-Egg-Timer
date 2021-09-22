//
//  ViewController.swift
//  Egg Timer
//
//  Created by Eetu Hernesniemi on 21.9.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topTextLabel: UILabel!
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
        topTextLabel.text = "Boiling " + hardness + " Eggs."
        timerSeconds = eggBoilTimeInMinutes[hardness]! * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.updateTimerCounting()
        }
    }
    
    func updateTimerCounting(){
        print(timerSeconds)
        if(timerSeconds > 0){
            timerSeconds -= 1
        } else{
            timer.invalidate()
            alarm()
        }
    }
    
    func alarm(){
        //TODO: alarm noice implementation
        topTextLabel.text = "DONE!"
    }
}

