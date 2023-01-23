//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Николай Коваленко on 07.01.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeSlider: UISlider!
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
    private let questions = Question.getQuestion()
    private var quetionIndex = 0
    private var currentAnswers: [Answer] {
        questions[quetionIndex].answers
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func multipleButtonAnswerPressed(_ sender: Any) {
        
    }
    
    @IBAction func rangeButtonAnswerPressed(_ sender: Any) {
        
    }
    
    
}
// MARK: - Private Metods
extension QuestionsViewController {
    private func updateUI() {
        // Hide stacks
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        // Get curent quetion
        let currentQuestion = questions[quetionIndex]
        
        // Set current quetion for question label
        questionLabel.text = currentQuestion.title
        
        //  Calculate progress
        
        let totalProgress = Float(quetionIndex) / Float(questions.count)
        
        // Set progress for question progress view
        progressView.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = " Вопрос №\(quetionIndex + 1 ) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponceType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .mulitple:
            break
        case .range:
            break
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answers) in zip(singleButtons, answers) {
            button.setTitle(answers.title, for: .normal)
            
        }
        
        
        
    }
}
