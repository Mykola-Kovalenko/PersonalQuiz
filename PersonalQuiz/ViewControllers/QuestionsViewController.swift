//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Николай Коваленко on 07.01.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeSlider: UISlider!
    
    @IBOutlet var progressView: UIProgressView!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
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
        let currentQuestion = questions[questionIndex]
        
        // Set current quetion for question label
        questionLabel.text = currentQuestion.title
        
        //  Calculate progress
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for question progress view
        progressView.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = "Вопрос №\(questionIndex + 1 ) из \(questions.count)"
        
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
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
        
        
        
    }
}
