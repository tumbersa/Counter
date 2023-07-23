//
//  ViewController.swift
//  Counter
//
//  Created by Глеб Капустин on 22.07.2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet private weak var counterValueLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var workDisplayTextView: UITextView!
    
    private var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workDisplayTextView.isEditable = false
        workDisplayTextView.text = "История изменений:\n"
    }
    
    private func timeСalculation()->String {
        let date = DateFormatter()
        date.dateFormat = "HH:mm E, d MMM y"
        return date.string(from: Date.now)
    }
    
    private func scrollTextViewToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
    @IBAction private func plusOne(_ sender: Any) {
        value += 1
        counterValueLabel.text = "Значение счётчика: \(value)"
        workDisplayTextView.text += "\(timeСalculation()): значение изменено на +1\n"
        scrollTextViewToBottom(textView: workDisplayTextView)
    }
    
    @IBAction private func minusOneOrNothing(_ sender: Any) {
        if value != 0 {
            value -= 1
            counterValueLabel.text = "Значение счётчика: \(value)"
            workDisplayTextView.text += "\(timeСalculation()): значение изменено на -1\n"
        } else {
            workDisplayTextView.text += "\(timeСalculation()): попытка уменьшить значение счётчика ниже 0\n"
        }
        scrollTextViewToBottom(textView: workDisplayTextView)
    }
    
    @IBAction private func refreshValue(_ sender: Any) {
        value = 0
        counterValueLabel.text = "Значение счётчика: \(value)"
        workDisplayTextView.text += "\(timeСalculation()): значение сброшено\n"
        scrollTextViewToBottom(textView: workDisplayTextView)
    }
    
    
}


