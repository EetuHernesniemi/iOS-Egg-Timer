//
//  ViewController.swift
//  Egg Timer
//
//  Created by Eetu Hernesniemi on 21.9.2021.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness : String = sender.currentTitle!//Make sure egg buttons have correct title values.
        print(hardness)
        print(eggTimes[hardness]!)
    }
}

