//
//  ViewController.swift
//  Egg Timer
//
//  Created by Eetu Hernesniemi on 21.9.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var boilProgressBar: UIProgressView!
    let eggBoilTimeInMinutes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var hardness : String = ""
    var timer = Timer()
    var timerCurrentSeconds: Int = 0
    var timerTotalSeconds: Int = 0
    
    override func viewDidLoad() {
        boilProgressBar.progress = 1
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        boilProgressBar.progress = 1
        hardness = sender.currentTitle!//Make sure egg buttons have correct title values.
        topTextLabel.text = "Boiling " + hardness + " Eggs."
        timerTotalSeconds = eggBoilTimeInMinutes[hardness]! * 60
        timerCurrentSeconds = timerTotalSeconds
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.updateTimerCounting()
        }
    }
    
    func updateTimerCounting(){
        if(timerCurrentSeconds > 0){
            timerCurrentSeconds -= 1
            setProgressBarValue()
        } else{
            timer.invalidate()
            alarm()
        }
    }
    
    func alarm(){
        //TODO: alarm noice implementation
        topTextLabel.text = "DONE!"
    }
    
    func setProgressBarValue(){
        var divisionResult : Float = 0
        if(timerCurrentSeconds > 0){
            divisionResult = Float(timerCurrentSeconds) / Float(timerTotalSeconds)
        }
        boilProgressBar.progress = divisionResult
    }
}

