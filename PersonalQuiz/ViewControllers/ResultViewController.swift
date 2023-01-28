//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Николай Коваленко on 23.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var presonalIdentifcator: UILabel!
    @IBOutlet var explanations: UILabel!
    var current: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
        // Do any additional setup after loading the view.
    }
    private func getResult() {
        var frequencyOfAnimals:[AnimalType: Int] = [:]
        
        let animals = current.map { $0.type }
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequncyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequncyAnimal)
    }
    private func updateUI(with animal: AnimalType) {
        presonalIdentifcator.text = "Вы - \(animal.rawValue)"
        explanations.text = "\(animal.definition)"
        
    }
    

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
    }
}
