//
//  ViewController.swift
//  Counter
//
//  Created by Глеб Капустин on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var workDisplayTextView: UITextView!
    
    var value = 0
    
    func timeСalculation()->String {
        let date = DateFormatter()
        date.dateFormat = "HH:mm E, d MMM y"
        return date.string(from: Date.now)
    }
    
    @IBAction func plusOne(_ sender: Any) {
        value += 1
        counterValueLabel.text = "Значение счётчика: \(value)"
        workDisplayTextView.text += "\(timeСalculation()): значение изменено на +1\n"
    }
    
    @IBAction func minusOneOrNothing(_ sender: Any) {
        if value != 0 {
            value -= 1
            counterValueLabel.text = "Значение счётчика: \(value)"
            workDisplayTextView.text += "\(timeСalculation()): значение изменено на -1\n"
        } else {
            workDisplayTextView.text += "\(timeСalculation()): попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    @IBAction func refreshValue(_ sender: Any) {
        value = 0
        counterValueLabel.text = "Значение счётчика: \(value)"
        workDisplayTextView.text += "\(timeСalculation()): значение сброшено\n"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workDisplayTextView.isEditable = false
        workDisplayTextView.text = "История изменений:\n"
    }
    
}

