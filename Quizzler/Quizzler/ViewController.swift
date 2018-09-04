//
//  ViewController.swift
//  Quizzler
//

//  Created by SinhHN on 26/08/2018.
//  Copyright © 2018 vnguider.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var currentQuestion: Int = 0
    var score: Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    fileprivate func isLastQuestion() -> Bool {
        return currentQuestion >= allQuestions.list.count - 1
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        if !isLastQuestion() {
            nextQuestion()
        }
        else {
            let alert = UIAlertController(title: "Awsome", message: "You have finished all the questions. Are you continue", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }


    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestion + 1) / \(allQuestions.list.count)"
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(currentQuestion + 1)
    }


    func nextQuestion() {
        currentQuestion += 1
        updateUI()
    }


    func checkAnswer() {
        let correctAnswer = allQuestions.list[currentQuestion].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Success")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong")
        }
        
    }


    func startOver() {
        currentQuestion = 0
        score = 0
        pickedAnswer = false
        updateUI()
    }
}
