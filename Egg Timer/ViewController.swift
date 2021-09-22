//
//  ViewController.swift
//  Egg Timer
//
//  Created by Eetu Hernesniemi on 21.9.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var boilProgressBar: UIProgressView!
    let eggBoilTimeInMinutes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var hardness : String = ""
    var timer = Timer()
    var timerCurrentSeconds: Int = 0
    var timerTotalSeconds: Int = 0
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        boilProgressBar.progress = 0
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        boilProgressBar.progress = 0
        hardness = sender.currentTitle!//Make sure egg buttons have correct title values.
        topTextLabel.text = "Boiling " + hardness + " Eggs."
        timerTotalSeconds = eggBoilTimeInMinutes[hardness]! * 60
        timerCurrentSeconds = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            self.updateTimerCounting()
        }
    }
    
    func updateTimerCounting(){
        if(timerCurrentSeconds < timerTotalSeconds){
            timerCurrentSeconds += 1
            setProgressBarValue()
        } else{
            timer.invalidate()
            alarm()
        }
    }
    
    func alarm(){
        topTextLabel.text = "DONE!"
        setupPlayerWithKey(fileName: "alarm_sound")
        player?.play()
    }
    
    func setProgressBarValue(){
        var divisionResult : Float = 0
        if(timerCurrentSeconds > 0){
            divisionResult = Float(timerCurrentSeconds) / Float(timerTotalSeconds)
        }
        boilProgressBar.progress = divisionResult
    }
    
    func setupPlayerWithKey(fileName: String!){
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
                print("Error. Audio resource url not found")
                return
            }
            do {
                // AVAudioSession initialisation makes the app ready to takeover the device audio. Some devices may throw errors otherwise.
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                player!.prepareToPlay()
            } catch let error as NSError {
                print("Error in playSound func")
                print("Error: \(error.localizedDescription)")
            }
    }
}

