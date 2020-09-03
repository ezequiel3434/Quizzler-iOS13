//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var choice2Btn: UIButton!
    @IBOutlet weak var choice3Btn: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {
            return
        }
        
        
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    
    @objc func updateUI() {
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.getQuestionText()
        
        choice1Btn.setTitle(quizBrain.getBtn1Label(), for: .normal)
        choice2Btn.setTitle(quizBrain.getBtn2Label(), for: .normal)
        choice3Btn.setTitle(quizBrain.getBtn3Label(), for: .normal)
        
        choice1Btn.backgroundColor = UIColor.clear
        choice2Btn.backgroundColor = UIColor.clear
        choice3Btn.backgroundColor = UIColor.clear
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
}

