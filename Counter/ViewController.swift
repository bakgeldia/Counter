//
//  ViewController.swift
//  Counter
//
//  Created by Bakgeldi Alkhabay on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var counterAddButton: UIButton!
    @IBOutlet weak var counterReduceButton: UIButton!
    @IBOutlet weak var counterResetButton: UIButton!
    @IBOutlet weak var counterHistoryTextView: UITextView!
    
    var counter: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterValueLabel.text = "Значение счетчика: \(counter)"
        counterHistoryTextView.text = "История изменений:"
    }
    
    func returnDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        let formattedDate = dateFormatter.string(from: Date())
        
        return formattedDate
    }
    
    @IBAction func addToCounter(_ sender: Any) {
        counter += 1
        counterValueLabel.text = "Значение счетчика: \(counter)"
        counterHistoryTextView.text += "\n \(returnDateTime()): значение изменено на +1"
    }
    
    @IBAction func reduceCounterByOne(_ sender: Any) {
        if counter != 0 {
            counter -= 1
            counterValueLabel.text = "Значение счетчика: \(counter)"
            counterHistoryTextView.text += "\n \(returnDateTime()): значение изменено на -1"
        } else {
            counterHistoryTextView.text += "\n \(returnDateTime()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    
    @IBAction func resetCounter(_ sender: Any) {
        counter = 0
        counterValueLabel.text = "Значение счетчика: \(counter)"
        counterHistoryTextView.text += "\n \(returnDateTime()): значение сброшено"
    }
    
}

