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
    var point: Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[currentQuestion].questionText
    }


    fileprivate func isLastQuestion() -> Bool {
        return currentQuestion < allQuestions.list.count - 1
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        if isLastQuestion() {
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
        progressLabel.text = String(point)
        questionLabel.text = allQuestions.list[currentQuestion].questionText
    }


    func nextQuestion() {
        currentQuestion += 1
        updateUI()
    }


    func checkAnswer() {
        if pickedAnswer == allQuestions.list[currentQuestion].answer {
            point += 1
        }
    }


    func startOver() {
        currentQuestion = 0
        point = 0
        pickedAnswer = false
        updateUI()
    }



}
