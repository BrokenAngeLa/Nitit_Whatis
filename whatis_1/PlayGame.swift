//
//  PlayGame.swift
//  whatis_1
//
//  Created by student on 10/20/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
class PlayGame{
    
    var question: Results<GameQuestion>!
    var questionNo: UILabel!
    var scoreBoard: UILabel!
    var showImage: UIImageView!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    var checkAnswer: UIImageView!
    var count: Int = 0
    var mode: Int = 0
    var score: Int = 0
    var questionList: [Int] = []
    var qId: Int = 0
    var startEndTime: String = ""
    
    init(mode: Int) {
        question = DataBaseQuestion.getQuestion(num: mode)
        self.mode = mode
        timeStartEnd(status: true)
    }
    
    func playGame(questionNo: UILabel, scoreBoard: UILabel, showImage: UIImageView, btn1: UIButton, btn2: UIButton,btn3: UIButton, btn4: UIButton, checkAnswer: UIImageView) -> (questionNo: UILabel, scoreBoard: UILabel, showImage: UIImageView, btn1: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton, checkAnswer: UIImageView) {
        self.questionNo = questionNo
        self.scoreBoard = scoreBoard
        self.showImage = showImage
        self.btn1 = btn1
        self.btn2 = btn2
        self.btn3 = btn3
        self.btn4 = btn4
        self.checkAnswer = checkAnswer
        control()
        return (questionNo, scoreBoard, showImage, btn1, btn2, btn3, btn4, checkAnswer)
    }
    
    func control() {
        if(end()) {
            updateScore()
            loadQuestion()
        }
        else {
            timeStartEnd(status: false)
            endGame()
        }
    }
    
    func timeStartEnd(status: Bool) {
        if status {
            startEndTime = Date.getTime()
        } else {
            startEndTime = startEndTime + " " + Date.getTime()
        }
    }
    func updateScore() {
        scoreBoard.text = "Score : \(score)"
    }
    
    func end() -> Bool {
        return count < DataBaseQuestion.getCount(num: mode)
    }
    
    func loadQuestion() {
        let id = randomQuestionNo()
        qId = id
        question = DataBaseQuestion.getQuestion(num: mode)
        count += 1
        questionNo.text = "Question No.\(count) (ID: \(id))"
        showImage.image = setImage()
        setBtn()
    }
    
    func randomQuestionNo() -> Int {
        var num = 0
        var checkduplicate = true
        while checkduplicate {
            num = Int(arc4random_uniform(UInt32(DataBaseQuestion.getCount(num: mode))))
            checkduplicate = duplicateNumber(num)
        }
        questionList.append(num)
        return num
    }
    
    func duplicateNumber(_ num: Int) -> Bool {
        if questionList != [] {
            for i in questionList {
                if i == num {
                    return true
                }
            }
        }
        return false
    }
    
    func endGame() {
        questionNo.text = "The End"
        updateScore()
        statusBtn(false)
        showImage.image = UIImage(named: "theend")
    }
    
    func statusBtn(_ status: Bool) {
        btn1.isEnabled = status
        btn2.isEnabled = status
        btn3.isEnabled = status
        btn4.isEnabled = status
    }
    
    func showResult(_ answer: Bool) {
        checkAnswer.isHidden = false
        if answer {
            checkAnswer.image = UIImage(named: "correct")
        }
        else {
            checkAnswer.image = UIImage(named: "wrong")
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            self.checkAnswer.alpha = 0.0
        }) { (_) in
            self.checkAnswer.alpha = 1.0
            self.checkAnswer.isHidden = true
        }
    }
    
    func setImage() -> UIImage {
        return UIImage(named: question[qId].imageId)!
    }
    
    func setBtn() {
        var button = [btn1,btn2,btn3,btn4]
        var newAnswerAndChoice = randomAnswer(question[qId].arrayAnswerAndChoice)
        for i in 0..<button.count {
            button[i]?.setTitle(newAnswerAndChoice[i], for: UIControlState())
            button[i]?.tag = newAnswerAndChoice[i] == newAnswerAndChoice[4] ? 1 : 0
        }
    }
    
    func randomAnswer(_ answer:[String]) -> [String] {
        var randomanswer:[String] = []
        var num = 0
        while randomanswer.count < answer.count-1 {
            var checkduplicate = true
            while checkduplicate {
                num = Int(arc4random_uniform(UInt32(answer.count-1)))
                checkduplicate = checkDuplicateAnswer(randomanswer,checkanswer: answer[num])
            }
            randomanswer.append(answer[num])
        }
        randomanswer.append(answer[4])
        return randomanswer
    }
    
    func checkDuplicateAnswer(_ randomanswer: [String],checkanswer: String) -> Bool {
        if randomanswer != [] {
            for i in randomanswer {
                if i == checkanswer {
                    return true
                }
            }
        }
        return false
    }
    
    func checkAnswer(btn: AnyObject) {
        score = btn.tag == 1 ? score + 1 : score
        btn.tag == 1 ? showResult(true) : showResult(false)
    }
    
    
}
