//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Kornakov on 02.04.2023.
//

import UIKit

class ViewController: UIViewController {

   var valueCounterLabel: Int = 0
   
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    @IBAction func plusChangeLabelButton(_ sender: Any) {
        valueCounterLabel += 1
        counterLabel.text = "Значение счётчика: \(valueCounterLabel)"
        historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): значение изменено на +1")
        
        scrollHistoryTextView()
    }
    
    @IBAction func minusChangeLabelButton(_ sender: Any) {
        guard valueCounterLabel > 0 else {
            valueCounterLabel = 0
            historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): попытка уменьшить значение счётчика ниже 0")
            
            scrollHistoryTextView()
            return
        }
        
        valueCounterLabel -= 1
        counterLabel.text = "Значение счётчика: \(valueCounterLabel)"
        historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): значение изменено на -1")
        
        scrollHistoryTextView()
    }
    
    @IBAction func resetChangeLabelButton(_ sender: Any) {
        guard valueCounterLabel > 0 else { return }
        
        valueCounterLabel = 0
        counterLabel.text = "Значение счётчика: \(valueCounterLabel)"
        historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): значение сброшено")
        
        scrollHistoryTextView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.text = "История изменений:"
        historyTextView.isEditable = false
        counterLabel.text = "0"
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        let currentDate = Date()
        let dateCurrent = dateFormatter.string(from: currentDate)
        
        return dateCurrent
    }
    
    func scrollHistoryTextView() {
        let diapason = NSMakeRange(historyTextView.text.count, 0)
        historyTextView.scrollRangeToVisible(diapason)
    }
}

