//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Kornakov on 02.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!

    // MARK: - Properties
    
    private var valueCounterLabel: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = "История изменений:"
        historyTextView.isEditable = false
        counterLabel.text = "0"
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
    }
    
    // MARK: - IBActions
    
    @IBAction private func plusChangeLabelButton(_ sender: Any) {
        valueCounterLabel += 1
        counterLabel.text = "Значение счётчика: \(valueCounterLabel)"
        historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): значение изменено на +1")
        
        scrollHistoryTextView()
    }
    
    @IBAction private func minusChangeLabelButton(_ sender: Any) {
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
    
    @IBAction private func resetChangeLabelButton(_ sender: Any) {
        guard valueCounterLabel > 0 else { return }
        
        valueCounterLabel = 0
        counterLabel.text = "Значение счётчика: \(valueCounterLabel)"
        historyTextView.text.append(contentsOf: "\n\(getCurrentDate()): значение сброшено")
        
        scrollHistoryTextView()
    }

    // MARK: - Methods
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        let currentDate = Date()
        let dateCurrent = dateFormatter.string(from: currentDate)
        
        return dateCurrent
    }
    
    private func scrollHistoryTextView() {
        let diapason = NSMakeRange(historyTextView.text.count, 0)
        historyTextView.scrollRangeToVisible(diapason)
    }
}

