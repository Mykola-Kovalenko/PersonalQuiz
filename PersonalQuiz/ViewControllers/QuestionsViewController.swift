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
    @IBOutlet var rangeSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangeSlider.maximumValue = answerCount
            rangeSlider.value = answerCount / 2
        }
    }
    
    @IBOutlet var progressView: UIProgressView!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChosen:[Answer] = []
    
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerPressed(_ sender: Any) {
        for(multipleSwitch, answer ) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeButtonAnswerPressed(_ sender: Any) {
        let index = lrintf(rangeSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let answers = segue.destination as? ResultViewController else { return }
        answers.current = answersChosen
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
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
    }
    
    private func showMultipleStackView(with answers: [Answer] ) {
        multipleStackView.isHidden = false
        
        for (labels, answers) in zip(multipleLabels, answers) {
            labels.text = answers.title
        }
    }
    
    private func showRangeStackView(with answers: [Answer] ) {
        rangeStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}





