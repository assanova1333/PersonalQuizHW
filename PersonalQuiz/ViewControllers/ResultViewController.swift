//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var animalNameLabel: UILabel!
    var selectedAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateMostFrequentAnimal()
        
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateMostFrequentAnimal() {
        let animalCounts = Dictionary(grouping: selectedAnswers, by: { $0.animal })
            .mapValues { $0.count }

        if let mostFrequentAnimal = animalCounts.max(by: { $0.value < $1.value })?.key {
            displayResult(for: mostFrequentAnimal)
        }
    }
    
    private func displayResult(for animal: Animal) {
        var resultText: String
        var animalNameText: String

        switch animal {
        case .rabbit:
            resultText = "🐰"
            animalNameText = "Вы - Кролик"
        case .dog:
            resultText = "🐶"
            animalNameText = "Вы - Собака"
        case .cat:
            resultText = "🐱"
            animalNameText = "Вы - Кошка"
        case .turtle:
            resultText = "🐢"
            animalNameText = "Вы - Черепаха"
        }
        
        resultLabel.text = resultText
        animalNameLabel.text = animalNameText
    }
}
