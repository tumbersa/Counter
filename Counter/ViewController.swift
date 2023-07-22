//
//  ViewController.swift
//  Counter
//
//  Created by Глеб Капустин on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var clickOnMeButton: UIButton!
    var value = 0
    @IBAction func changeCounterValueLabel(_ sender: Any) {
        value += 1
        counterValueLabel.text = "Значение счётчика: \(value)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

