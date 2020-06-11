//
//  ViewController.swift
//  Quizzler
//
//  Created by Soni Suman on 01/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    
    @IBOutlet weak var choice3: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {
            return
        }
        let result = quizBrain.checkAnswer(userAnswer)
        if result {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        questionLabel.text =  quizBrain.getQuestionText()
        progressView.progress = quizBrain.getQuestionProgress()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        choice1.setTitle(quizBrain.getFirstChoice(), for: .normal)
        choice2.setTitle(quizBrain.getSecondChoice(), for: .normal)
        choice3.setTitle(quizBrain.getThirdChoice(), for: .normal)
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
        scoreLabel.text = quizBrain.getScore()
        
    }
}

